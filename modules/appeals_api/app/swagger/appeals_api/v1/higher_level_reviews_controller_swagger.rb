# frozen_string_literal: true

class AppealsApi::V1::HigherLevelReviewsControllerSwagger
  include Swagger::Blocks

  OBJ = :object
  HLR_TAG = ['Higher-Level Reviews'].freeze

  read_file = ->(path) { File.read(AppealsApi::Engine.root.join(*path)) }
  read_json = ->(path) { JSON.parse(read_file.call(path)) }
  read_json_from_same_dir = ->(filename) { read_json.call(['app', 'swagger', 'appeals_api', 'v1', filename]) }

  response_hlr_show_not_found = read_json_from_same_dir['response_hlr_show_not_found.json']
  response_hlr_create_error = read_json_from_same_dir['response_hlr_create_error.json']

  example_all_fields_used = read_json[['spec', 'fixtures', 'valid_200996.json']]

  response_hlr_show_success = lambda do
    properties = {
      status: { '$ref': '#/components/schemas/hlrStatus' },
      updated_at: { '$ref': '#/components/schemas/timeStamp' },
      created_at: { '$ref': '#/components/schemas/timeStamp' },
      form_data: { '$ref': '#/components/schemas/hlrCreate' }
    }
    type = :HigherLevelReviewInfo
    schema = {
      type: OBJ,
      properties: {
        id: { '$ref': '#/components/schemas/uuid' },
        type: { type: :string, enum: [type] },
        attributes: { type: OBJ, properties: properties }
      }
    }
    time = '2020-04-23T21:06:12.531Z'
    attrs = { status: :processed, updated_at: time, created_at: time, form_data: example_all_fields_used }
    example = { data: { id: '1234567a-89b0-123c-d456-789e01234f56', type: type, attributes: attrs } }

    {
      description: 'Info about a single Higher-Level Review',
      content: { 'application/json': { schema: schema, examples: { 'HlrFound': { value: example } } } }
    }
  end.call

  headers_json_schema = read_json[['config', 'schemas', '200996_headers.json']]
  headers_swagger = AppealsApi::JsonSchemaToSwaggerConverter.new(headers_json_schema).to_swagger
  header_schemas = headers_swagger['components']['schemas']
  headers = header_schemas['hlrCreateParameters']['properties'].keys
  hlr_create_parameters = headers.map do |header|
    {
      name: header,
      'in': 'header',
      description: header_schemas[header]['allOf'][0]['description'],
      required: header_schemas['hlrCreateParameters']['required'].include?(header),
      schema: { '$ref': "#/components/schemas/#{header}" }
    }
  end

  hlr_create_json_schema = read_json[['config', 'schemas', '200996.json']]
  hlr_create_request_body = AppealsApi::JsonSchemaToSwaggerConverter.new(
    hlr_create_json_schema
  ).to_swagger['requestBody']
  hlr_create_request_body['content']['application/json']['examples'] = {
    'all fields used': { value: example_all_fields_used },
    'minimum fields used': { value: read_json[['spec', 'fixtures', 'valid_200996_minimum.json']] }
  }

  swagger_path '/higher_level_reviews' do
    operation :post, tags: HLR_TAG do
      key :summary, 'Create a Higher-Level Review'
      desc = 'Submits a Decision Review request of type *Higher-Level Review*. This endpoint is analogous ' \
        'to submitting [VA Form 20-0996](https://www.vba.va.gov/pubs/forms/VBA-20-0996-ARE.pdf) via mail or fax.'
      key :description, desc
      key :parameters, hlr_create_parameters
      key :requestBody, hlr_create_request_body
      key :responses, '200': response_hlr_show_success, '422': response_hlr_create_error
    end
  end

  swagger_path '/higher_level_reviews/{uuid}' do
    operation :get, tags: HLR_TAG do
      key :summary, 'Show a Higher-Level Review'
      key :description, 'Returns all of the data associated with a specific Higher-Level Review'
      parameter name: 'uuid', 'in': 'path', required: true, description: 'Higher-Level Review UUID' do
        schema { key :'$ref', :uuid }
      end
      key :responses, '200': response_hlr_show_success, '404': response_hlr_show_not_found
    end
  end

  swagger_path '/higher_level_reviews/schema' do
    operation :get, tags: HLR_TAG do
      key :summary, 'Return the JSON Schema for POST /higher_level_reviews'
      desc = 'Returns the [JSON Schema](https://json-schema.org/) for the `POST /higher_level_reviews` enpdoint.'
      key :description, desc
      response '200' do
        key :description, 'the JSON Schema for POST /higher_level_reviews'
        schema = JSON.pretty_generate AppealsApi::JsonSchemaToSwaggerConverter.remove_comments(hlr_create_json_schema)
        key :content, 'application/json': { examples: { default: { value: schema } } }
      end
    end
  end

  swagger_path '/higher_level_reviews/validate' do
    operation :post, tags: HLR_TAG do
      key :summary, 'Validate a POST /higher_level_reviews request body (dry run)'
      desc = 'Validate a `POST /higher_level_reviews` request body against the JSON Schema. ' \
        'Like the `POST /higher_level_reviews`, but *only* does the validations **—does not submit anything.**'
      key :description, desc
      key :parameters, hlr_create_parameters
      key :requestBody, hlr_create_request_body
      type = { type: :string, enum: [:higherLevelReviewValidation] }
      attrs = { type: OBJ, properties: { status: { type: :string, enum: [:valid] } } }
      example = { data: { type: type[:enum].first, attributes: { status: :valid } } }
      schema = { type: OBJ, properties: { data: { type: OBJ, properties: { type: type, attributes: attrs } } } }
      content = { 'application/json': { schema: schema, examples: { valid: { value: { data: example } } } } }
      key :responses, '200': { description: 'Valid', content: content }, '422': response_hlr_create_error
    end
  end
end
