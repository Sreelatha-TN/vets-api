# frozen_string_literal: true

# rubocop:disable Metrics/ClassLength

module PdfFill
  module Forms
    class Va21686c < FormBase
      include FormHelper
      ITERATOR = PdfFill::HashConverter::ITERATOR

      KEY = {
        'veteran_information' => {
          'full_name' => {
            'first' => {
              key: 'form1[0].#subform[17].VeteranFirstName[0]',
              limit: 12,
              question_num: 1,
              question_suffix: 'A',
              question_text: 'VETERAN/CLAIMANT\'S IDENTIFICATION INFORMATION > VETERAN\'S NAME (First, Middle Initial, Last)'
            },
            'middleInitial' => {
              key: 'form1[0].#subform[17].VeteranMiddleInitial1[0]',
              limit: 1,
              question_num: 1,
              question_suffix: 'B',
              question_text: 'VETERAN/CLAIMANT\'S IDENTIFICATION INFORMATION > VETERAN\'S NAME (First, Middle Initial, Last)'
            },
            'last' => {
              key: 'form1[0].#subform[17].VeteranLastName[0]',
              limit: 18,
              question_num: 1,
              question_suffix: 'C',
              question_text: 'VETERAN/CLAIMANT\'S IDENTIFICATION INFORMATION > VETERAN\'S NAME (First, Middle Initial, Last)'
            }
            # suffix
          },
          'ssn' => {
            'first' => {
              key: 'form1[0].#subform[17].Veterans_SocialSecurityNumber_FirstThreeNumbers[0]',
              limit: 3,
              question_num: 4,
              question_suffix: 'A',
              question_text: 'VETERAN/CLAIMANT\'S IDENTIFICATION INFORMATION > VETERAN\'S SOCIAL SECURITY NUMBER'
            },
            'second' => {
              key: 'form1[0].#subform[17].Veterans_SocialSecurityNumber_SecondTwoNumbers[0]',
              limit: 2,
              question_num: 4,
              question_suffix: 'B',
              question_text: 'VETERAN/CLAIMANT\'S IDENTIFICATION INFORMATION > VETERAN\'S SOCIAL SECURITY NUMBER'
            },
            'third' => {
              key: 'form1[0].#subform[17].Veterans_SocialSecurityNumber_LastFourNumbers[0]',
              limit: 4,
              question_num: 4,
              question_suffix: 'C',
              question_text: 'VETERAN/CLAIMANT\'S IDENTIFICATION INFORMATION > VETERAN\'S SOCIAL SECURITY NUMBER'
            }
          },
          'va_file_number' => {
            key: 'form1[0].#subform[17].VAFileNumber[0]',
            limit: 9,
            question_num: 3,
            question_suffix: 'A',
            question_text: 'VETERAN/CLAIMANT\'S IDENTIFICATION INFORMATION > VA FILE NUMBER (If known)'
          },
          'birth_date' => {
            'month' => {
              key: 'form1[0].#subform[17].DOBmonth[0]',
              limit: 2,
              question_num: 4,
              question_suffix: 'A',
              question_text: 'VETERAN/CLAIMANT\'S IDENTIFICATION INFORMATION > VETERAN\'S DATE OF BIRTH (MM-DD-YYYY)'
            },
            'day' => {
              key: 'form1[0].#subform[17].DOBday[0]',
              limit: 2,
              question_num: 4,
              question_suffix: 'B',
              question_text: 'VETERAN/CLAIMANT\'S IDENTIFICATION INFORMATION > VETERAN\'S DATE OF BIRTH (MM-DD-YYYY)'
            },
            'year' => {
              key: 'form1[0].#subform[17].DOByear[0]',
              limit: 4,
              question_num: 4,
              question_suffix: 'C',
              question_text: 'VETERAN/CLAIMANT\'S IDENTIFICATION INFORMATION > VETERAN\'S DATE OF BIRTH (MM-DD-YYYY)'
            }
          },
          # claimant's name
          # claimant's social security number
          'service_number' => {
            key: 'form1[0].#subform[17].VeteransServiceNumber[0]',
            limit: 9,
            question_num: 7,
            question_suffix: 'A',
            question_text: 'VETERAN/CLAIMANT\'S IDENTIFICATION INFORMATION > VETERAN\'S SERVICE NUMBER (If applicable)'
          }
        },
        'veteran_contact_information' => {
          'phone_number' => {
            'phone_area_code' => {
              key: 'form1[0].#subform[17].TelephoneNumber_AreaCode[0]',
              limit: 3,
              question_num: 8,
              question_suffix: 'A',
              question_text: 'VETERAN/CLAIMANT\'S IDENTIFICATION INFORMATION > TELEPHONE NUMBER'
            },
            'phone_first_three_numbers' => {
              key: 'form1[0].#subform[17].TelephoneNumber_FirstThreeNumbers[0]',
              limit: 3,
              question_num: 8,
              question_suffix: 'B',
              question_text: 'VETERAN/CLAIMANT\'S IDENTIFICATION INFORMATION > TELEPHONE NUMBER'
            },
            'phone_last_four_numbers' => {
              key: 'form1[0].#subform[17].TelephoneNumber_LastFourNumbers[0]',
              limit: 4,
              question_num: 8,
              question_suffix: 'C',
              question_text: 'VETERAN/CLAIMANT\'S IDENTIFICATION INFORMATION > TELEPHONE NUMBER'
            }
          },
          'email_address' => {
            key: 'form1[0].#subform[17].Email_Address[0]',
            limit: 30,
            question_num: 9,
            question_suffix: 'A',
            question_text: 'VETERAN/CLAIMANT\'S IDENTIFICATION INFORMATION > E-MAIL ADDRESS'
          },
          'veteran_address' => {
            'address_line1' => {
              key: 'form1[0].#subform[17].CurrentMailingAddress_NumberAndStreet[0]',
              limit: 30,
              question_num: 10,
              question_suffix: 'A',
              question_text: 'VETERAN/CLAIMANT\'S IDENTIFICATION INFORMATION > COMPLETE MAILING ADDRESS OF VETERAN/CLAIMANT'
            },
            'address_line2' => {
              key: 'form1[0].#subform[17].CurrentMailingAddress_ApartmentOrUnitNumber[0]',
              limit: 5,
              question_num: 10,
              question_suffix: 'B',
              question_text: 'VETERAN/CLAIMANT\'S IDENTIFICATION INFORMATION > COMPLETE MAILING ADDRESS OF VETERAN/CLAIMANT'
            },
            # address_line3
            'city' => {
              key: 'form1[0].#subform[17].CurrentMailingAddress_City[0]',
              limit: 18,
              question_num: 10,
              question_suffix: 'C',
              question_text: 'VETERAN/CLAIMANT\'S IDENTIFICATION INFORMATION > COMPLETE MAILING ADDRESS OF VETERAN/CLAIMANT'
            },
            'state_code' => {
              key: 'form1[0].#subform[17].CurrentMailingAddress_StateOrProvince[0]',
              limit: 2,
              question_num: 10,
              question_suffix: 'D',
              question_text: 'VETERAN/CLAIMANT\'S IDENTIFICATION INFORMATION > COMPLETE MAILING ADDRESS OF VETERAN/CLAIMANT'
            },
            'country_name' => {
              key: 'form1[0].#subform[17].CurrentMailingAddress_Country[0]',
              limit: 2,
              question_num: 10,
              question_suffix: 'E',
              question_text: 'VETERAN/CLAIMANT\'S IDENTIFICATION INFORMATION > COMPLETE MAILING ADDRESS OF VETERAN/CLAIMANT'
            },
            'zip_code' => {
              'firstFive' => {
                key: 'form1[0].#subform[17].CurrentMailingAddress_ZIPOrPostalCode_FirstFiveNumbers[0]',
                limit: 5,
                question_num: 10,
                question_suffix: 'F',
                question_text: 'VETERAN/CLAIMANT\'S IDENTIFICATION INFORMATION > COMPLETE MAILING ADDRESS OF VETERAN/CLAIMANT'
              },
              'lastFour' => {
                key: 'form1[0].#subform[17].CurrentMailingAddress_ZIPOrPostalCode_LastFourNumbers[0]',
                limit: 4,
                question_num: 10,
                question_suffix: 'G',
                question_text: 'VETERAN/CLAIMANT\'S IDENTIFICATION INFORMATION > COMPLETE MAILING ADDRESS OF VETERAN/CLAIMANT'
              }
            }
          }
        }, # end veteran_contact_information
        'dependents_application' => {
          # ------------  SECTION II: INFORMATION NEEDED TO ADD SPOUSE  ------------ #
          'spouse_information' => {
            'full_name' => {
              'first' => {
                key: 'form1[0].#subform[17].SPOUSEFirstName[0]',
                limit: 12,
                question_num: '11A',
                question_suffix: 'A',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > SPOUSE\'S NAME'
              },
              'middleInitial' => {
                key: 'form1[0].#subform[17].SPOUSEMiddleInitial1[0]',
                limit: 1,
                question_num: '11A',
                question_suffix: 'B',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > SPOUSE\'S NAME'
              },
              'last' => {
                key: 'form1[0].#subform[17].SPOUSELastName[0]',
                limit: 18,
                question_num: '11A',
                question_suffix: 'C',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > SPOUSE\'S NAME'
              }
              # suffix
            }, # end full_name
            'birth_date' => {
              'month' => {
                key: "form1[0].#subform[17].DOBmonth[1]",
                limit: 2,
                question_num: '11B',
                question_suffix: 'A',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > SPOUSE\'S DOB MONTH'
              },
              'day' => {
                key: "form1[0].#subform[17].DOBday[1]",
                limit: 2,
                question_num: '11B',
                question_suffix: 'B',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > SPOUSE\'S DOB DAY'
              },
              'year' => {
                key: "form1[0].#subform[17].DOByear[1]",
                limit: 4,
                question_num: '11B',
                question_suffix: 'C',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > SPOUSE\'S DOB YEAR'
              }
            }, # end birth_date
            'ssn' => {
              'first' => {
                key: "form1[0].#subform[17].SpouseSocialSecurityNumber_FirstThreeNumbers[0]",
                limit: 3,
                question_num: '11C',
                question_suffix: 'A',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > SPOUSE\'S SSN FIRST THREE NUMBERS'
              },
              'second' => {
                key: "form1[0].#subform[17].SpouseSocialSecurityNumber_SecondTwoNumbers[0]",
                limit: 2,
                question_num: '11C',
                question_suffix: 'B',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > SPOUSE\'S SSN SECOND TWO NUMBERS'
              },
              'third' => {
                key: "form1[0].#subform[17].SpouseSocialSecurityNumber_LastFourNumbers[0]",
                limit: 4,
                question_num: '11C',
                question_suffix: 'C',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > SPOUSE\'S SSN LAST FOUR NUMBERS'
              }
            }, # end spouse ssn
            'is_veteran' => {
              'is_veteran_yes' => { key: 'form1[0].#subform[17].YES[0]' },
              'is_veteran_no' => { key: 'form1[0].#subform[17].NO[0]' }
            },
            'va_file_number' => { # XXX this group needs three parts like SSN, name looks v. sim
              'va_file_number_first_three' => {
                key: "form1[0].#subform[17].SpouseSocialSecurityNumber_FirstThreeNumbers[1]",
                limit: 3,
                question_num: '12B',
                question_suffix: 'A',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > SPOUSE VA FILE NUMBER > FIRST THREE'
              },
              'va_file_number_second_two' => {
                key: "form1[0].#subform[17].SpouseSocialSecurityNumber_SecondTwoNumbers[1]",
                limit: 2,
                question_num: '12B',
                question_suffix: 'B',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > SPOUSE VA FILE NUMBER > SECOND TWO'
              },
              'va_file_number_last_four' => {
                key: "form1[0].#subform[17].SpouseSocialSecurityNumber_LastFourNumbers[1]",
                limit: 4,
                question_num: '12B',
                question_suffix: 'C',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > SPOUSE VA FILE NUMBER > LAST FOUR'
              }
            }, # end of spouse va file number
            'service_number' => {
              key: "form1[0].#subform[17].SPOUSEServiceNumber[0]",
              limit: 9,
              question_num: '12A',
              question_suffix: 'C',
              question_text: 'INFORMATION NEEDED TO ADD SPOUSE > IS YOUR SPOUSE A VETERAN'
            } # end of spouse service number
          }, # end spouse_information
          'current_marriage_information' => {
            'date' => {
              'month' => {
                key: "form1[0].#subform[17].DOMARRIAGEmonth[0]",
                limit: 2,
                question_num: '11D',
                question_suffix: 'A',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > DATE OF MARRIAGE MONTH'
              },
              'day' => {
                key: "form1[0].#subform[17].DOMARRIAGEday[0]",
                limit: 2,
                question_num: '11D',
                question_suffix: 'B',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > DATE OF MARRIAGE DAY'
              },
              'year' => {
                key: "form1[0].#subform[17].DOMARRIAGEyear[0]",
                limit: 4,
                question_num: '11D',
                question_suffix: 'C',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > DATE OF MARRIAGE YEAR'
              }
            },
            'location' => {
              'city' => {
                key: "form1[0].#subform[17].CurrentMailingAddress_City[2]",
                limit: 18,
                question_num: '11E',
                question_suffix: 'A',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > MARRIAGE CITY'
              },
              'state' => {
                key: "form1[0].#subform[17].CurrentMailingAddress_StateOrProvince[2]",
                limit: 2,
                question_num: '11E',
                question_suffix: 'B',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > MARRIAGE STATE'
              },
              'country' => {
                key: "form1[0].#subform[17].CurrentMailingAddress_Country[2]",
                limit: 2,
                question_num: '11E',
                question_suffix: 'C',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > MARRIAGE COUNTRY'
              }
            }, # end location
            'type' => {
              'religious_ceremony' => {
                key: 'form1[0].#subform[17].ReligiousCeremony[0]'
              },
              'common_law' => {
                key: 'form1[0].#subform[17].CommonLaw[0]'
              },
              'tribal' => {
                key: 'form1[0].#subform[17].Tribal[0]'
              },
              'proxy' => {
                key: 'form1[0].#subform[17].Proxy[0]'
              },
              'OTHER' => {
                key: 'form1[0].#subform[17].OTHER_Explain[0]'
              }
            }, # end of marriage type
            'type_other' => {
              key: 'form1[0].#subform[17].Other[0]',
              limit: 9,
              question_num: '11F',
              question_suffix: 'A',
              question_text: 'INFORMATION NEEDED TO ADD SPOUSE > MARRIAGE TYPE OTHER EXPLANATION'
            }
          }, # end current_marriage_information
          'does_live_with_spouse' => {
            'spouse_does_live_with_veteran' => {
              'spouse_does_live_with_veteran_yes' => { key: 'form1[0].#subform[17].YES[1]' }, #XXX
              'spouse_does_live_with_veteran_no' => { key: 'form1[0].#subform[17].NO[1]' } #XXX
            },
            'current_spouse_reason_for_separation' => {
              key: 'form1[0].#subform[17].Reasonforseparation[0]',
              limit: 20,
              question_num: '13B',
              question_suffix: 'A',
              question_text: 'INFORMATION NEEDED TO ADD SPOUSE > REASON FOR SEPARATION'
            },
            'address' => {
              'address_line1' => {
                key: "form1[0].#subform[17].CurrentMailingAddress_NumberAndStreet[1]",
                limit: 30,
                question_num: '13C',
                question_suffix: 'A',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > LIVING WITH SPOUSE > ADDRESS'
              },
              'address_line2' => {
                key: "form1[0].#subform[17].CurrentMailingAddress_ApartmentOrUnitNumber[1]",
                limit: 5,
                question_num: '13C',
                question_suffix: 'B',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > LIVING WITH SPOUSE > ADDRESS'
              },
              'city' => {
                key: "form1[0].#subform[17].CurrentMailingAddress_City[1]",
                limit: 18,
                question_num: '13C',
                question_suffix: 'C',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > LIVING WITH SPOUSE > CITY'
              },
              'state_code' => {
                key: "form1[0].#subform[17].CurrentMailingAddress_StateOrProvince[1]",
                limit: 2,
                question_num: '13C',
                question_suffix: 'D',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > LIVING WITH SPOUSE > STATE'
              },
              'country_name' => {
                key: "form1[0].#subform[17].CurrentMailingAddress_Country[1]",
                limit: 2,
                question_num: '13C',
                question_suffix: 'E',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > LIVING WITH SPOUSE > COUNTRY'
              },
              'zip_code' => {
                'firstFive' => {
                  key: "form1[0].#subform[17].CurrentMailingAddress_ZIPOrPostalCode_FirstFiveNumbers[1]",
                  limit: 5,
                  question_num: '13C',
                  question_suffix: 'F',
                  question_text: 'INFORMATION NEEDED TO ADD SPOUSE > LIVING WITH SPOUSE > ZIP FIRST 5'
                }, # end of zip first 5
                'lastFour' => {
                  key: "form1[0].#subform[17].CurrentMailingAddress_ZIPOrPostalCode_LastFourNumbers[1]",
                  limit: 4,
                  question_num: '13C',
                  question_suffix: 'G',
                  question_text: 'INFORMATION NEEDED TO ADD SPOUSE > LIVING WITH SPOUSE > ZIP LAST 4'
                } # end of zip last 4
              } # end of zip
            } # end of address
          }, # end does_live_with_spouse
          'veteran_marriage_history' => {
            limit: 4,
            first_key: 'full_name',
            'full_name' => {
              'first' => {
                key: 'veteran.previousSpouse.firstName[%iterator%]',
                limit: 12,
                question_num: 14,
                question_suffix: 'A',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > PREVIOUS MARRIAGE HISTORY >  PREVIOUS SPOUSE FIRST NAME'
              }, # end of first name
              'middle' => {
                key: 'form1[0].#subform[18].CHILDMiddleInitial1[%iterator%]',
                limit: 1,
                question_num: 14,
                question_suffix: 'B',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > PREVIOUS MARRIAGE HISTORY >  PREVIOUS SPOUSE MIDDLE INITIAL'
              },  # end of middle initial
              'last' => {
                key: 'form1[0].#subform[18].CHILDLastName[%iterator%]',
                limit: 18,
                question_num: 14,
                question_suffix: 'C',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > PREVIOUS MARRIAGE HISTORY >  PREVIOUS SPOUSE LAST NAME'
              }
              # 'suffix' => {
              # @TODO
              # } # end of suffix
            },  # end of end of full name
            'start_date' => {
              'month' => {
                key: 'veteran_marriage_history.start_date.month[%iterator%]',
                limit: 2,
                question_num: 14,
                question_suffix: 'E',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > PREVIOUS MARRIAGE HISTORY > MONTH'
              }, # end of marriage start month
              'day' => {
                key: 'veteran_marriage_history.start_date.day[%iterator%]',
                limit: 2,
                question_num: 14,
                question_suffix: 'F',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > PREVIOUS MARRIAGE HISTORY > MONTH'
              }, # end of marriage start day
              'year' => {
                key: 'veteran_marriage_history.start_date.year[%iterator%]',
                limit: 4,
                question_num: 14,
                question_suffix: 'G',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > PREVIOUS MARRIAGE HISTORY > YEAR'
              } # end of marriage start year
            },
            #, # end of start_date
            'start_location' => {
              'city' => {
                key: 'veteran.previousMarriage.startCity[%iterator%]',
                limit: 18,
                question_num: 14,
                question_suffix: 'E',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > PREVIOUS MARRIAGE HISTORY > CITY'
              }, # end of city
              'state' => {
                key: 'veteran_marriage_history.start_location.state[%iterator%]',
                limit: 2,
                question_num: '14A 2',
                question_suffix: 'E',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > PREVIOUS MARRIAGE HISTORY > STATE'
              } # end of state
            }, #end of start_location
            'reason_marriage_ended' => {
              'death' => { key: 'veteran_marriage_history.reason_marriage_ended.death[%iterator%]' },
              'divorce' => { key: 'veteran_marriage_history.reason_marriage_ended.divorce[%iterator%]' },
              'annulment' => { key: 'veteran_marriage_history.reason_marriage_ended.annulment[%iterator%]' },
              'other' => { key: 'veteran_marriage_history.reason_marriage_ended.other[%iterator%]' }
            },
            'reason_marriage_ended_other' => {
              key: 'veteran_marriage_history.reason_marriage_ended_other[%iterator%]',
              #limit: 12, # @TODO THIS BREAKS - WHYYY???
              question_num: 14,
              question_suffix: 'A',
              question_text: 'INFORMATION NEEDED TO ADD SPOUSE > PREVIOUS MARRIAGE HISTORY > REASON FOR TERMINATION'
            },
            'end_date' => {
              'month' => {
                key: 'veteran_marriage_history.end_date.month[%iterator%]',
                limit: 2,
                question_num: '14A 4',
                question_suffix: 'A',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > PREVIOUS MARRIAGE HISTORY > TERMINATION MONTH'
              }, # end of termination month
              'day' => {
                key: 'veteran_marriage_history.end_date.day[%iterator%]',
                limit: 2,
                question_num: '14A 4',
                question_suffix: 'B',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > PREVIOUS MARRIAGE HISTORY >  TERMINATION DAY'
              }, # end of termination day
              'year' => {
                key: 'veteran_marriage_history.end_date.year[%iterator%]',
                limit: 4,
                question_num: '14A 4',
                question_suffix: 'C',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > PREVIOUS MARRIAGE HISTORY >  TERMINATION YEAR'
              } # end of termination year
            }, # end of end date
            'end_location' => {
              'city' => {
                key: 'veteran.previousMarriage.terminationCity[%iterator%]',
                limit: 18,
                question_num: 14,
                question_suffix: 'D',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > PREVIOUS MARRIAGE HISTORY >  TERMINATION CITY'
              }, # end city
              'state' => {
                key: 'veteran.previousMarriage.terminationState[%iterator%]',
                limit: 2,
                question_num: '14A 4',
                question_suffix: 'E',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > PREVIOUS MARRIAGE HISTORY >  TERMINATION STATE'
              } # end state
            } # end of end_location
          }, # end veteran_marriage_history
          'spouse_marriage_history' => {
            limit: 4,
            first_key: 'full_name',
            'full_name' => {
              'first' => {
                key: 'veteranSpouse.previousSpouse.firstName[%iterator%]',
                limit: 12,
                question_num: 15,
                question_suffix: 'A',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > PREVIOUS MARRIAGE HISTORY >  SPOUSES PREVIOUS SPOUSE FIRST NAME'
              },
              'middleInitial' => {
                key: 'veteranSpouse.previousSpouse.middleInitial[%iterator%]',
                limit: 1,
                question_num: 15,
                question_suffix: 'B',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > PREVIOUS MARRIAGE HISTORY >  SPOUSES PREVIOUS SPOUSE MIDDLE INITIAL'
              },
              'last' => {
                key: 'veteranSpouse.previousSpouse.lastName[%iterator%]',
                limit: 18,
                question_num: 15,
                question_suffix: 'C',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > PREVIOUS MARRIAGE HISTORY >  SPOUSES PREVIOUS SPOUSE LAST NAME'
              },
              'suffix' => {
                # @TODO not in the form
              } # end of suffix
            }, # end of full name
            'start_date' => {
              'month' => {
                key: 'spouse_marriage_history.start_date.month[%iterator%]',
                limit: 2,
                question_num: '15A 2',
                question_suffix: 'A',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > PREVIOUS MARRIAGE HISTORY >  PREVIOUS SPOUSE MARRIAGE DATE MONTH'
              },
              'day' => {
                key: 'spouse_marriage_history.start_date.day[%iterator%]',
                limit: 2,
                question_num: '15A 2',
                question_suffix: 'B',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > PREVIOUS MARRIAGE HISTORY >  PREVIOUS SPOUSE MARRIAGE DATE DAY'
              },
              'year' => {
                key: 'spouse_marriage_history.start_date.year[%iterator%]',
                limit: 4,
                question_num: '15A 2',
                question_suffix: 'C',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > PREVIOUS MARRIAGE HISTORY >  PREVIOUS SPOUSE MARRIAGE DATE YEAR'
              },
            }, # end of start date
            'start_location' => {
              'city' => {
                key: 'spouse_marriage_history.start_location.city[%iterator%]',
                limit: 18,
                question_num: 15,
                question_suffix: 'D',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > PREVIOUS MARRIAGE HISTORY >  PREVIOUS SPOUSE MARRIAGE LOCATION CITY'
              },
              'state' => {
                key: 'spouse_marriage_history.start_location.state[%iterator%]',
                limit: 2,
                question_num: 15,
                question_suffix: 'E',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > PREVIOUS MARRIAGE HISTORY >  PREVIOUS SPOUSE MARRIAGE LOCATION STATE'
              },
              # @TODO country key: 'spouse_marriage_history.start_location.country[%iterator%]'
            }, # end of start location
            'reason_marriage_ended' => {
              'death' => { key: 'spouse_marriage_history.reason_marriage_ended.death[%iterator%]' },
              'divorce' => { key: 'spouse_marriage_history.reason_marriage_ended.divorce[%iterator%]' },
              'annulment' => { key: 'spouse_marriage_history.reason_marriage_ended.annulment[%iterator%]' },
              'other' => { key: 'spouse_marriage_history.reason_marriage_ended.other[%iterator%]' }
            },
            'reason_marriage_ended_other' => {
              key: 'spouse_marriage_history.reason_marriage_ended_other[%iterator%]',
              #limit: 12, # @TODO THIS BREAKS - WHYYY???
              question_num: '14A 3',
              question_suffix: 'A',
              question_text: 'INFORMATION NEEDED TO ADD SPOUSE > PREVIOUS MARRIAGE HISTORY > REASON FOR TERMINATION'
            },
            'end_date' => {
              'month' => {
                key: 'spouse_marriage_history.end_date.month[%iterator%]',
                limit: 2,
                question_num: '15A 4',
                question_suffix: 'A',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > PREVIOUS MARRIAGE HISTORY >  PREVIOUS SPOUSE MARRIAGE DATE ENDED MONTH'
              }, # end of end date month
              'day' => {
                key: 'spouse_marriage_history.end_date.day[%iterator%]',
                limit: 2,
                question_num: '15A 4',
                question_suffix: 'B',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > PREVIOUS MARRIAGE HISTORY >  PREVIOUS SPOUSE MARRIAGE DATE ENDED DAY'
              }, # end of end date day
              'year' => {
                key: 'spouse_marriage_history.end_date.year[%iterator%]',
                limit: 4,
                question_num: '15A 4',
                question_suffix: 'C',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > PREVIOUS MARRIAGE HISTORY >  PREVIOUS SPOUSE MARRIAGE DATE ENDED YEAR'
              } # end of end date year
            }, # end of end date
            'end_location' => {
              'city' => {
                key: 'spouse_marriage_history.end_location.city[%iterator%]',
                limit: 18,
                question_num: '15A 4',
                question_suffix: 'D',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > PREVIOUS MARRIAGE HISTORY >  PREVIOUS SPOUSE MARRIAGE LOCATION CITY'
              },
              'state' => {
                key: 'spouse_marriage_history.end_location.state[%iterator%]',
                limit: 2,
                question_num: '15A 4',
                question_suffix: 'E',
                question_text: 'INFORMATION NEEDED TO ADD SPOUSE > PREVIOUS MARRIAGE HISTORY >  PREVIOUS SPOUSE MARRIAGE LOCATION STATE'
              }
              # @TODO country key: 'spouse_marriage_history.end_location.country[%iterator%]'
            } # end of location
          }, # end spouse_marriage_history
          # -----------------  SECTION III: INFORMATION NEEDED TO ADD CHILD(REN)  ----------------- #
          'children_to_add' => {
            limit: 4,
            first_key: 'full_name',
            'full_name' => {
              'first' => {
                key: 'children_to_add.full_name.first[%iterator%]',
                limit: 12,
                question_num: '16A',
                question_suffix: 'A',
                question_text: 'INFORMATION NEEDED TO ADD a CHILD > WHEN ADOPTED IS SELECTED > FIRST NAME'
              },
              'middleInitial' => {
                key: 'children_to_add.full_name.middleInitial[%iterator%]',
                limit: 1,
                question_num: '16A',
                question_suffix: 'B',
                question_text: 'INFORMATION NEEDED TO ADD a CHILD > WHEN ADOPTED IS SELECTED > MIDDLE INITIAL'
              },
              'last' => {
                key: 'children_to_add.full_name.last[%iterator%]',
                limit: 18,
                question_num: '16A',
                question_suffix: 'B',
                question_text: 'INFORMATION NEEDED TO ADD a CHILD > WHEN ADOPTED IS SELECTED > LAST NAME'
              },
              # 'suffix' => {
              #  @TODO suffix
              # }
            }, # end of full name
            'ssn' => {
              'first' => {
                key: 'children_to_add.ssn.first[%iterator%]',
                limit: 3,
                question_num: '16B',
                question_suffix: 'A',
                question_text: 'INFORMATION NEEDED TO ADD a CHILD > WHEN ADOPTED IS SELECTED > FIRST THREE SSN'
              }, # end of ssn first three
              'second' => {
                key: 'children_to_add.ssn.second[%iterator%]',
                limit: 2,
                question_num: '16B',
                question_suffix: 'B',
                question_text: 'INFORMATION NEEDED TO ADD a CHILD > WHEN ADOPTED IS SELECTED > SECOND TWO SSN'
              }, # end of second two
              'third' => {
                key: 'children_to_add.ssn.third[%iterator%]',
                limit: 4,
                question_num: '16B',
                question_suffix: 'C',
                question_text: 'INFORMATION NEEDED TO ADD a CHILD > WHEN ADOPTED IS SELECTED > LAST FOUR SSN'
              }, # end of last four
            }, # end of ssn
            'birth_date' => {
              'month' => {
                key: 'children_to_add.birth_date.month[%iterator%]',
                limit: 2,
                question_num: '16C',
                question_suffix: 'A',
                question_text: 'INFORMATION NEEDED TO ADD a CHILD > WHEN ADOPTED IS SELECTED > THEIR BIRTHDAY MONTH'
              },
              'day' => {
                key: 'children_to_add.birth_date.day[%iterator%]',
                limit: 4,
                question_num: '16C',
                question_suffix: 'B',
                question_text: 'INFORMATION NEEDED TO ADD a CHILD > WHEN ADOPTED IS SELECTED > THEIR BIRTHDAY DAY'
              },
              'year' => {
                key: 'children_to_add.birth_date.year[%iterator%]',
                limit: 4,
                question_num: '16B',
                question_suffix: 'C',
                question_text: 'INFORMATION NEEDED TO ADD a CHILD > WHEN ADOPTED IS SELECTED > THEIR BIRTHDAY YEAR'
              }
            }, # birth_date
            'place_of_birth' => {
              'city' => {
                key: 'children_to_add.place_of_birth.city[%iterator%]',
                limit: 18,
                question_num: '16D',
                question_suffix: 'A',
                question_text: 'INFORMATION NEEDED TO ADD a CHILD > CHILD DOES NOT LIVE WITH CLAIMANT > PLACEMENT OF BIRTH > CITY'
              },
              'state' => {
                key: 'children_to_add.place_of_birth.state[%iterator%]',
                limit: 2,
                question_num: '16D',
                question_suffix: 'B',
                question_text: 'INFORMATION NEEDED TO ADD a CHILD > CHILD DOES NOT LIVE WITH CLAIMANT > PLACE OF BIRTH > STATE'
              }
              # @TODO country
            }, # end place_of_birth
            'child_address_info' => {
              'person_child_lives_with' => {
                'first' => {
                  key: 'children_to_add.child_address_info.person_child_lives_with.first[%iterator%]',
                  limit: 12,
                  question_num: '16E',
                  question_suffix: 'A',
                  question_text: 'INFORMATION NEEDED TO ADD a CHILD > CHILD DOES NOT LIVE WITH CLAIMANT > FIRST NAME'
                }, # end of first name
                'middleInitial' => {
                  key: 'children_to_add.child_address_info.person_child_lives_with.middleInitial[%iterator%]',
                  limit: 1,
                  question_num: '16E',
                  question_suffix: 'B',
                  question_text: 'INFORMATION NEEDED TO ADD a CHILD > CHILD DOES NOT LIVE WITH CLAIMANT > MIDDLE INITIAL'
                }, # end of middle initial
                'last' => {
                  key: 'children_to_add.child_address_info.person_child_lives_with.last[%iterator%]',
                  limit: 18,
                  question_num: '16E',
                  question_suffix: 'C',
                  question_text: 'INFORMATION NEEDED TO ADD a CHILD > CHILD DOES NOT LIVE WITH CLAIMANT > LAST NAME'
                } # end of last name
              }, # end of person child lives with
              'address' => {
                'address_line1' => {
                  key: 'children_to_add.child_address_info.address.address_line1[%iterator%]',
                  limit: 27,
                  question_num: '16F',
                  question_suffix: 'A',
                  question_text: 'INFORMATION NEEDED TO ADD a CHILD > CHILD DOES NOT LIVE WITH CLAIMANT > ADDRESS'
                }, # end of address line1
                'address_line2' => {
                  key: 'children_to_add.child_address_info.address.address_line2[%iterator%]',
                  limit: 5,
                  question_num: '16F',
                  question_suffix: 'B',
                  question_text: 'INFORMATION NEEDED TO ADD a CHILD > CHILD DOES NOT LIVE WITH CLAIMANT > ADDRESS'
                },
                'city' => {
                  key: 'children_to_add.child_address_info.address.city[%iterator%]',
                  limit: 18,
                  question_num: '16F',
                  question_suffix: 'C',
                  question_text: 'INFORMATION NEEDED TO ADD a CHILD > CHILD DOES NOT LIVE WITH CLAIMANT > CITY'
                }, # end of city
                'state_code' => {
                  key: 'children_to_add.child_address_info.address.state_code[%iterator%]',
                  limit: 2,
                  question_num: '16F',
                  question_suffix: 'D',
                  question_text: 'INFORMATION NEEDED TO ADD a CHILD > CHILD DOES NOT LIVE WITH CLAIMANT > STATE'
                },
                'country_name' => {
                  key: 'children_to_add.child_address_info.address.country_name[%iterator%]',
                  limit: 2,
                  question_num: '16F',
                  question_suffix: 'E',
                  question_text: 'INFORMATION NEEDED TO ADD a CHILD > CHILD DOES NOT LIVE WITH CLAIMANT > COUNTRY'
                },
                'zip_code' => {
                  'firstFive' => {
                    key: 'children_to_add.child_address_info.address.zip_code.first_five[%iterator%]',
                    limit: 5,
                    question_num: '16F',
                    question_suffix: 'F',
                    question_text: 'INFORMATION NEEDED TO ADD a CHILD > CHILD DOES NOT LIVE WITH CLAIMANT > ZIP'
                  },
                  'lastFour' => {
                    key: 'children_to_add.child_address_info.address.zip_code.last_four[%iterator%]',
                    limit: 4,
                    question_num: '16F',
                    question_suffix: 'G',
                    question_text: 'INFORMATION NEEDED TO ADD a CHILD > CHILD DOES NOT LIVE WITH CLAIMANT > ZIP'
                  }
                }
              } # end address
            }, # end child_address_info
            'child_status' => {
              'biological' => { key: 'children_to_add.child_status.biological[%iterator%]' },
              'school_age_in_school' => { key: 'children_to_add.child_status.school_age_in_school[%iterator%]' },
              'adopted' => { key: 'children_to_add.child_status.adopted[%iterator%]' },
              'incapable_self_support' => { key: 'children_to_add.child_status.incapable_self_support[%iterator%]' },
              'child_previously_married' => { key: 'children_to_add.child_status.child_previously_married[%iterator%]' },
              'stepchild' => { key: 'children_to_add.child_status.stepchild[%iterator%]' }
            }, # end of child status
            'previous_marriage_details' => {
              'date_marriage_ended' => {
                'month' => {
                  key: 'children_to_add.previous_marriage_details.date_marriage_ended.month[%iterator%]',
                  limit: 2,
                  question_num: '16H',
                  question_suffix: 'A',
                  question_text: 'INFORMATION NEEDED TO ADD a CHILD > CHILD DOES NOT LIVE WITH CLAIMANT > END DATE OF CHILDS MARRIAGE > MONTH'
                }, # end of month
                'day' => {
                  key: 'children_to_add.previous_marriage_details.date_marriage_ended.day[%iterator%]',
                  limit: 2,
                  question_num: '16H',
                  question_suffix: 'B',
                  question_text: 'INFORMATION NEEDED TO ADD a CHILD > CHILD DOES NOT LIVE WITH CLAIMANT > END DATE OF CHILDS MARRIAGE > DAY'
                }, # end of day
                'year' => {
                  key: 'children_to_add.previous_marriage_details.date_marriage_ended.year[%iterator%]',
                  limit: 4,
                  question_num: '16H',
                  question_suffix: 'C',
                  question_text: 'INFORMATION NEEDED TO ADD a CHILD > CHILD DOES NOT LIVE WITH CLAIMANT > END DATE OF CHILDS MARRIAGE > YEAR'
                } # end of year
              }, # end of date marriage ended
              'reason_marriage_ended' => {
                'declared_void' => { key: 'children_to_add.previous_marriage_details.reason_marriage_ended.declared_void[%iterator%]' },
                'annulled' => { key: 'children_to_add.previous_marriage_details.reason_marriage_ended.annulled[%iterator%]' },
                'other' => { key: 'children_to_add.previous_marriage_details.reason_marriage_ended.other[%iterator%]' }
              },
              'reason_marriage_ended_other' => {
                'reason_marriage_ended_other_line1' => {
                  key: 'children_to_add.previous_marriage_details.reason_marriage_ended_other.reason_marriage_ended_other_line1[%iterator%]',
                  limit: 8,
                  question_num: '16H',
                  question_suffix: 'G', # after buttons?
                  question_text: 'INFORMATION NEEDED TO ADD a CHILD > CHILD DOES NOT LIVE WITH CLAIMANT > END DATE OF CHILDS MARRIAGE > REASON LINE1'
                },
                'reason_marriage_ended_other_line2' => {
                  key: 'children_to_add.previous_marriage_details.reason_marriage_ended_other.reason_marriage_ended_other_line2[%iterator%]',
                  limit: 8,
                  question_num: '16H',
                  question_suffix: 'H', # after buttons?
                  question_text: 'INFORMATION NEEDED TO ADD a CHILD > CHILD DOES NOT LIVE WITH CLAIMANT > END DATE OF CHILDS MARRIAGE > REASON LINE2'
                }
              } # end reason_marriage_ended_other
            } # end previous_marriage_details
            # @TODO 16I. IF YOU CHECKED "STEPCHILD" IN ITEM 17G, IS STEPCHILD THE BIOLOGICAL CHILD OF YOUR SPOUSE?
          }, # end children_to_add
          # ------------  SECTION IV: VETERAN REPORTING DIVORCE FROM FORMER SPOUSE  ----------------- #
          'report_divorce' => {
            'full_name' => {
              'first' => {
                key: 'form1[0].#subform[25].#subform[26].#subform[27].FORMERSPOUSEFIRST[0]',
                limit: 12,
                question_num: '20A',
                question_suffix: 'A',
                question_text: 'VETERAN REPORTING DIVORCE FROM FORMER SPOUSE > NAME OF FORMER SPOUSE'
              },
              'middleInitial' => {
                key: 'form1[0].#subform[25].#subform[26].#subform[27].FORMERSPOUSEMiddleInitial1[0]',
                limit: 1,
                question_num: '20A',
                question_suffix: 'B',
                question_text: 'VETERAN REPORTING DIVORCE FROM FORMER SPOUSE > NAME OF FORMER SPOUSE'
              },
              'last' => {
                key: 'form1[0].#subform[25].#subform[26].#subform[27].FORMERSPOUSELastName[0]',
                limit: 18,
                question_num: '20A',
                question_suffix: 'C',
                question_text: 'VETERAN REPORTING DIVORCE FROM FORMER SPOUSE > NAME OF FORMER SPOUSE'
              },
              'suffix' => {
                # @TODO  does not exist on pdf
              }
            }, # end full_name
            'location' => {
              'city' => {
                key: 'form1[0].#subform[25].#subform[26].#subform[27].CurrentMailingAddress_City[27]',
                limit: 18,
                question_num: '20B',
                question_suffix: 'A',
                question_text: 'VETERAN REPORTING DIVORCE FROM FORMER SPOUSE > PLACE OF DIVORCE'
              },
              'state' => {
                key: 'form1[0].#subform[25].#subform[26].#subform[27].CurrentMailingAddress_StateOrProvince[27]',
                limit: 2,
                question_num: '20B',
                question_suffix: 'B',
                question_text: 'VETERAN REPORTING DIVORCE FROM FORMER SPOUSE > PLACE OF DIVORCE'
              },
              'country' => {
                # ???  not showing on front end
              }
            },
            'date' => {
              'month' => {
                key: 'form1[0].#subform[25].#subform[26].#subform[27].DATEOFDIVORCE_MONTH[0]',
                limit: 2,
                question_num: '20C',
                question_suffix: 'A',
                question_text: 'VETERAN REPORTING DIVORCE FROM FORMER SPOUSE > DATE OF DIVORCE'
              },
              'day' => {
                key: 'form1[0].#subform[25].#subform[26].#subform[27].DATEOFDIVORCE_DAY[0]',
                limit: 2,
                question_num: '20C',
                question_suffix: 'B',
                question_text: 'VETERAN REPORTING DIVORCE FROM FORMER SPOUSE > DATE OF DIVORCE'
              },
              'year' => {
                key: 'form1[0].#subform[25].#subform[26].#subform[27].DATEOFDIVORCE_YEAR[0]',
                limit: 4,
                question_num: '20C',
                question_suffix: 'C',
                question_text: 'VETERAN REPORTING DIVORCE FROM FORMER SPOUSE > DATE OF DIVORCE'
              }
            },
            'reason_marriage_ended' => {
              # ???  this gets added to remarks section
              # NOTE: If marriage ended as an annulment or declared void, use Section IX, Item 25, Remarks to explain.
            }
          }, # end report_divorce
          # -----------------  SECTION V: VETERAN/CLAIMANT REPORTING ON STEPCHILD(REN)  ----------------- #
          'step_children' => {
            limit: 2,
            first_key: 'full_name',
            'supporting_stepchild' => {
              'supporting_stepchild_yes' => { 'key': 'form1[0].#subform[25].#subform[26].#subform[27].RadioButtonList[79]' },
              'supporting_stepchild_no' => { 'key': 'form1[0].#subform[25].#subform[26].#subform[27].RadioButtonList[78]' }
            }, # end of supporting_stepchild
            'full_name' => {
              'first' => {
                key: "form1[0].#subform[25].#subform[26].#subform[27].CHILDFirstName[26]",
                limit: 12,
                question_num: '21C',
                question_suffix: 'A',
                question_text: 'INFORMATION NEEDED TO ADD A STEPCHILD > FIRST NAME'
              }, # end of first name of the stepchild you are supporting
              'middle' => {
                key: "form1[0].#subform[25].#subform[26].#subform[27].CHILDMiddleInitial1[18]",
                limit: 1,
                question_num: '21C',
                question_suffix: 'B',
                question_text: 'INFORMATION NEEDED TO ADD A STEPCHILD > MIDDLE INITIAL'
              }, # end of middle initial of the stepchild you are supporting
              'last' => {
                key: "form1[0].#subform[25].#subform[26].#subform[27].CHILDLastName[18]",
                limit: 18,
                question_num: '21C',
                question_suffix: 'C',
                question_text: 'INFORMATION NEEDED TO ADD A STEPCHILD > LAST NAME'
              } # end of last name of the stepchild you are supporting
            },
            'who_does_the_stepchild_live_with' => {
              'first' => {
                key: "form1[0].#subform[25].#subform[26].#subform[27].CHILDFirstName[27]",
                limit: 12,
                question_num: '21D',
                question_suffix: 'A',
                question_text: 'INFORMATION NEEDED TO ADD A STEPCHILD > LIVING WITH WHO > FIRST NAME'
              }, # end of first
              'middle' => {
                key: "form1[0].#subform[25].#subform[26].#subform[27].CHILDMiddleInitial1[19]",
                limit: 1,
                question_num: '21D',
                question_suffix: 'B',
                question_text: 'INFORMATION NEEDED TO ADD A STEPCHILD > LIVING WITH WHO > MIDDLE INITIAL'
              }, # end of middle
              'last' => {
                key: "form1[0].#subform[25].#subform[26].#subform[27].CHILDLastName[19]",
                limit: 18,
                question_num: '21D',
                question_suffix: 'C',
                question_text: 'INFORMATION NEEDED TO ADD A STEPCHILD > LIVING WITH WHO > LAST NAME'
              }, # end of last
            }, # end of who_does_the_stepchild_live_with
            'address' => {
              'address_line1' => {
                key: "form1[0].#subform[25].#subform[26].#subform[27].CurrentMailingAddress_NumberAndStreet[6]",
                limit: 27,
                question_num: '21E',
                question_suffix: 'A',
                question_text: 'INFORMATION NEEDED TO ADD A STEPCHILD > LIVING WHERE > STREET'
              }, # end of address_line1
              'city' => {
                key: "form1[0].#subform[25].#subform[26].#subform[27].CurrentMailingAddress_City[28]",
                limit: 18,
                question_num: '21E',
                question_suffix: 'C',
                question_text: 'INFORMATION NEEDED TO ADD A STEPCHILD > LIVING WHERE > CITY'
              }, # end of city
              'state_code' => {
                key: "form1[0].#subform[25].#subform[26].#subform[27].CurrentMailingAddress_StateOrProvince[28]",
                limit: 2,
                question_num: '21E',
                question_suffix: 'D',
                question_text: 'INFORMATION NEEDED TO ADD A STEPCHILD > LIVING WHERE > STATE'
              }, # end of state_code
              'country_name' => {
                key: "form1[0].#subform[25].#subform[26].#subform[27].CurrentMailingAddress_Country[28]",
                limit: 2,
                question_num: '21E',
                question_suffix: 'E',
                question_text: 'INFORMATION NEEDED TO ADD A STEPCHILD > LIVING WHERE > COUNTRY'
              }, # end of country_name
              'zip_code' => {
                'firstFive' => {
                  key: "form1[0].#subform[25].#subform[26].#subform[27].CurrentMailingAddress_ZIPOrPostalCode_FirstFiveNumbers[6]",
                  limit: 5,
                  question_num: '21E',
                  question_suffix: 'F',
                  question_text: 'INFORMATION NEEDED TO ADD A STEPCHILD > LIVING WHERE > ZIPCODE FIRST FIVE'
                }, # end of zip first 5
                'lastFour' => {
                  key: "form1[0].#subform[25].#subform[26].#subform[27].CurrentMailingAddress_ZIPOrPostalCode_LastFourNumbers[14]",
                  limit: 4,
                  question_num: '21E',
                  question_suffix: 'G',
                  question_text: 'INFORMATION NEEDED TO ADD A STEPCHILD > LIVING WHERE > ZIPCODE LAST FOUR'
                }, # end of last 4
              } # end of zip_code
            }, # end of address
            # @TODO
            # 21F. DATE STEPCHILD LEFT VETERAN'S HOUSEHOLD (MM-DD-YYYY)
            'living_expenses_paid' => {
              'more_than_half' => { 'key': 'form1[0].#subform[25].#subform[26].#subform[27].RadioButtonList[80]' },
              'half' => { 'key': 'form1[0].#subform[25].#subform[26].#subform[27].RadioButtonList[81]' },
              'less_than_half' => { 'key': 'form1[0].#subform[25].#subform[26].#subform[27].RadioButtonList[82]' }
            } # end of living_expenses_paid
          }, # end of step_children
          # -----------------  SECTION VI: VETERAN/CLAIMANT REPORTING DEATH OF A DEPENDENT  ----------------- #
          'deaths' => {
            limit: 2,
            first_key: 'full_name',
            'dependent_type' => {
              'spouse' => { 'key': 'form1[0].#subform[28].#subform[29].#subform[30].RadioButtonList[87]' },
              'minor_child' => { 'key': 'form1[0].#subform[28].#subform[29].#subform[30].RadioButtonList[85]' },
              'stepchild' => { 'key': 'form1[0].#subform[28].#subform[29].#subform[30].RadioButtonList[84]' },
              'adopted' => { 'key': 'form1[0].#subform[28].#subform[29].#subform[30].RadioButtonList[83]' },
              'dependent_parent' => { 'key': 'form1[0].#subform[28].#subform[29].#subform[30].RadioButtonList[89]' },
              'child_incapable_self_support' => { 'key': 'form1[0].#subform[28].#subform[29].#subform[30].RadioButtonList[86]' },
              '18_23_years_old_in_school' => { 'key': 'form1[0].#subform[28].#subform[29].#subform[30].RadioButtonList[88]' }
            },
            'child_status' => {
              # child
              'child_under18' => {
                # XXX true
              } # end of
            },
            'full_name' => {
              'first' => {
                key: "form1[0].#subform[28].#subform[29].#subform[30].CHILDFirstName[31]",
                limit: 12,
                question_num: '22B',
                question_suffix: 'A',
                question_text: 'INFORMATION NEEDED TO REPORT DEPEDENT DEATH > NAME > FIRST'
              }, # end of first name of deceased
              'middle' => {
                key: "form1[0].#subform[28].#subform[29].#subform[30].CHILDMiddleInitial1[22]",
                limit: 1,
                question_num: '22B',
                question_suffix: 'B',
                question_text: 'INFORMATION NEEDED TO REPORT DEPEDENT DEATH > NAME > MIDDLE INITIAL'
              },# end of middle initial name of deceased
              'last' => {
                key: "form1[0].#subform[28].#subform[29].#subform[30].CHILDLastName[22]",
                limit: 18,
                question_num: '22B',
                question_suffix: 'C',
                question_text: 'INFORMATION NEEDED TO REPORT DEPEDENT DEATH > NAME > LAST'
              } # end of last name of deceased
              # 'suffix' => {
              # @TODO
              # }
            }, # end of full name
            'date' => {
              'month' => {
                key: "form1[0].#subform[28].#subform[29].#subform[30].DATEOFDIVORCE_MONTH[2]",
                limit: 2,
                question_num: '22C',
                question_suffix: 'A',
                question_text: 'INFORMATION NEEDED TO REPORT DEPEDENT DEATH > DATE > MONTH'
              }, # end of month of death
              'day' => {
                key: "form1[0].#subform[28].#subform[29].#subform[30].DATEOFDIVORCE_DAY[2]",
                limit: 2,
                question_num: '22C',
                question_suffix: 'B',
                question_text: 'INFORMATION NEEDED TO REPORT DEPEDENT DEATH > DATE > DAY'
              }, # end of day of death
              'year' => {
                key: "form1[0].#subform[28].#subform[29].#subform[30].DATEOFDIVORCE_YEAR[2]",
                limit: 4,
                question_num: '22C',
                question_suffix: 'C',
                question_text: 'INFORMATION NEEDED TO REPORT DEPEDENT DEATH > DATE > YEAR'
              }, # end of year of death
            }, # end of date of death
            'location' => {
              'city' => {
                key: "form1[0].#subform[28].#subform[29].#subform[30].CurrentMailingAddress_City[30]",
                limit: 18,
                question_num: '22D',
                question_suffix: 'A',
                question_text: 'INFORMATION NEEDED TO REPORT DEPEDENT DEATH > PLACE > CITY'
              }, # end of place of death city
              'state' => {
                key: "form1[0].#subform[28].#subform[29].#subform[30].CurrentMailingAddress_StateOrProvince[30]",
                limit: 2,
                question_num: '22D',
                question_suffix: 'B',
                question_text: 'INFORMATION NEEDED TO REPORT DEPEDENT DEATH > PLACE > STATE'
              } # end of place of death state
            } # end location
          }, # end of deaths
          # -----------------  SECTION VII: VETERAN/CLAIMANT REPORTING MARRIAGE OF CHILD  ----------------- #
          'child_marriage' => {
            'full_name' => {
              'first' => {
                key: "form1[0].#subform[28].#subform[29].#subform[30].CHILDFirstName[30]",
                limit: 12,
                question_num: '23A',
                question_suffix: 'A',
                question_text: 'INFORMATION NEEDED TO REPORT MARRIAGE OF A CHILD > NAME > FIRST'
              }, # end of first name of married child
              'middle' => {
                key: "form1[0].#subform[28].#subform[29].#subform[30].CHILDMIDDLEName[0]",
                limit: 1,
                question_num: '23A',
                question_suffix: 'B',
                question_text: 'INFORMATION NEEDED TO REPORT MARRIAGE OF A CHILD > NAME > MIDDLE INITIAL'
              }, # end of middle initial name of married child
              'last' => {
                key: "form1[0].#subform[28].#subform[29].#subform[30].CHILDLASTName[0]",
                limit: 18,
                question_num: '23A',
                question_suffix: 'C',
                question_text: 'INFORMATION NEEDED TO REPORT MARRIAGE OF A CHILD > NAME > LAST'
              }, # end of last name of married child
              # 'suffix' => {
              # @TODO
              # } # end of suffix
            }, # end full_name
            'date_married' => {
              'month' => {
                key: "form1[0].#subform[28].#subform[29].#subform[30].DateOfMarriage_Month[0]",
                limit: 2,
                question_num: '23B',
                question_suffix: 'A',
                question_text: 'INFORMATION NEEDED TO REPORT MARRIAGE OF CHILD > DATE > MONTH'
              },
              'day' => {
                key: "form1[0].#subform[28].#subform[29].#subform[30].DateOfMarriage_Day[0]",
                limit: 2,
                question_num: '23B',
                question_suffix: 'B',
                question_text: 'INFORMATION NEEDED TO REPORT MARRIAGE OF CHILD > DATE > DAY'
              },
              'year' => {
                key: "form1[0].#subform[28].#subform[29].#subform[30].DateOfMarriage_Year[0]",
                limit: 4,
                question_num: '23B',
                question_suffix: 'C',
                question_text: 'INFORMATION NEEDED TO REPORT MARRIAGE OF CHILD > DATE > YEAR'
              }
            } # end date_married
          }, # end of child marriage
          # -----------------  SECTION VIII: VETERAN/CLAIMANT REPORTING A SCHOOLCHILD OVER 18 HAS STOPPED ATTENDING SCHOOL  ----------------- #
          'child_stopped_attending_school' => {
            'full_name' => {
              'first' => {
                key: "form1[0].#subform[28].#subform[29].#subform[30].NAMEOFSCHOOLCHILDFirstName[0]",
                limit: 12,
                question_num: '24A',
                question_suffix: 'A',
                question_text: 'INFORMATION NEEDED TO REPORT CHILD STOPPED ATTENDING SCHOOL > NAME > FIRST'
              },
              'middle' => {
                key: "form1[0].#subform[28].#subform[29].#subform[30].NAMEOFSCHOOLCHILDMIDDLEName[0]",
                limit: 1,
                question_num: '24A',
                question_suffix: 'B',
                question_text: 'INFORMATION NEEDED TO REPORT CHILD STOPPED ATTENDING SCHOOL > NAME > MIDDLE INITIAL'
              },
              'last' => {
                key: "form1[0].#subform[28].#subform[29].#subform[30].NAMEOFSCHOOLCHILDLASTName[0]",
                limit: 18,
                question_num: '24A',
                question_suffix: 'C',
                question_text: 'INFORMATION NEEDED TO REPORT CHILD STOPPED ATTENDING SCHOOL > NAME > LAST'
              }
              # 'suffix' => {
              # @TODO
              # }
            },
            'date_child_left_school' => {
              'month' => {
                key: "form1[0].#subform[28].#subform[29].#subform[30].DateSchoochildStoppedAttendingSchool_Month[0]",
                limit: 2,
                question_num: '24B',
                question_suffix: 'A',
                question_text: 'INFORMATION NEEDED TO REPORT CHILD STOPPED ATTENDING SCHOOL > DATE > MONTH'
              },
              'day' => {
                key: "form1[0].#subform[28].#subform[29].#subform[30].DateSchoolchildStoppedAttendingSchool_Day[0]",
                limit: 2,
                question_num: '24B',
                question_suffix: 'B',
                question_text: 'INFORMATION NEEDED TO REPORT CHILD STOPPED ATTENDING SCHOOL > DATE > DAY'
              },
              'year' => {
                key: "form1[0].#subform[28].#subform[29].#subform[30].DateSchoolchildStoppedAttendingSshool_Year[0]",
                limit: 4,
                question_num: '24B',
                question_suffix: 'C',
                question_text: 'INFORMATION NEEDED TO REPORT CHILD STOPPED ATTENDING SCHOOL > DATE > YEAR'
              }
            } # end date_child_left_school
          } # end child_stopped_attending_school
          # -----------------  SECTION IX: REMARKS  ----------------- #

        }, # end dependents_application
        #'remarks' => {
          'remarks_line1' => {
            key: 'form1[0].#subform[31].#subform[32].#subform[33].Remarks[0]',
            limit: 35,
            question_num: 25,
            question_suffix: 'A',
            question_text: 'REMARKS'
          },
          'remarks_line2' => {
            key: 'form1[0].#subform[31].#subform[32].#subform[33].Remarks[1]',
            limit: 35,
            question_num: 25,
            question_suffix: 'B',
            question_text: 'REMARKS'
          },
          # @TODO remarks
        #},
        'signature' => {
          key: 'form1[0].#subform[34]'
        },
        'signature_date' => {
          'month' => {
            key: 'form1[0].#subform[31].#subform[32].#subform[33].DateMM[0]'
          },
          'day' => {
            key: 'form1[0].#subform[31].#subform[32].#subform[33].DateDD[0]'
          },
          'year' => {
            key: 'form1[0].#subform[31].#subform[32].#subform[33].DateYYYY[0]'
          }
        } # end signature_date
      }.freeze

      def merge_fields
        merge_veteran_helpers
        merge_spouse_helpers
        merge_previous_marriage_helpers
        merge_spouse_marriage_history_helpers
        merge_child_helpers

        merge_divorce_helpers
        merge_stepchildren_helpers

        merge_death_helpers
        merge_child_marriage_helpers
        merge_child_stopped_attending_school_helpers

        expand_signature(@form_data['veteran_information']['full_name'])
        @form_data['signature_date'] = split_date(@form_data['signatureDate'])

        @form_data['remarks_line1'] = "REMARKS GO HERE"
        @form_data['remarks_line2'] = "REMARKS REMARKS REMARKS"

        @form_data
      end

      private

      def merge_veteran_helpers
        # extract middle initial
        @form_data['veteran_information']['full_name']['middle'] = extract_middle_i(@form_data['veteran_information'], 'full_name')

        # extract birth date
        @form_data['veteran_information']['birth_date'] = split_date(@form_data['veteran_information']['birth_date'])

        # extract ssn
        ssn = @form_data['veteran_information']['ssn']
        @form_data['veteran_information']['ssn'] = split_ssn(ssn.delete('-')) unless ssn.blank?

        phone_number = @form_data['veteran_contact_information']['phone_number']
        phone_number = phone_number.delete('^0-9') unless phone_number.blank?
        @form_data['veteran_contact_information']['phone_number'] = {
          "phone_area_code" => phone_number[0..2],
          "phone_first_three_numbers" => phone_number[3..5],
          "phone_last_four_numbers" => phone_number[6..9]
        } unless phone_number.blank?

        # extract postal code
        @form_data['veteran_contact_information']['veteran_address']['postalCode'] = @form_data['veteran_contact_information']['veteran_address']['zip_code']
        @form_data['veteran_contact_information']['veteran_address']['zip_code'] = split_postal_code(@form_data['veteran_contact_information']['veteran_address'])
      end

      def merge_spouse_helpers
        # extract middle initial
        @form_data['dependents_application']['spouse_information']['full_name']['middle'] = extract_middle_i(@form_data['dependents_application']['spouse_information'], 'full_name')

        # extract birth date
        @form_data['dependents_application']['spouse_information']['birth_date'] = split_date(@form_data['dependents_application']['spouse_information']['birth_date'])

        # extract ssn
        ssn = @form_data['dependents_application']['spouse_information']['ssn']
        @form_data['dependents_application']['spouse_information']['ssn'] = split_ssn(ssn.delete('-')) unless ssn.blank?

        # extract marriage date
        @form_data['dependents_application']['current_marriage_information']['date'] = split_date(@form_data['dependents_application']['current_marriage_information']['date'])

        va_file_number = @form_data['dependents_application']['spouse_information']['va_file_number']
        va_file_number = va_file_number.delete('-') unless va_file_number.blank?
        @form_data['dependents_application']['spouse_information']['va_file_number'] = {
          'va_file_number_first_three' => va_file_number[0..2],
          'va_file_number_second_two' => va_file_number[3..4],
          'va_file_number_last_four' => va_file_number[5..8]
        }

        # extract postal code
        @form_data['dependents_application']['does_live_with_spouse']['address']['postalCode'] = @form_data['dependents_application']['does_live_with_spouse']['address']['zip_code']
        @form_data['dependents_application']['does_live_with_spouse']['address']['zip_code'] = split_postal_code(@form_data['dependents_application']['does_live_with_spouse']['address'])

        expand_marriage_type
        expand_is_veteran
        expand_does_live_with_spouse
      end

      def merge_previous_marriage_helpers
        previous_spouses = @form_data['dependents_application']['veteran_marriage_history']
        # extract veteran marriage history dates
        previous_spouses.each do |spouse|
          spouse['start_date'] = split_date(spouse['start_date'])
          spouse['end_date'] = split_date(spouse['end_date'])
        end

        expand_reason_marriage_ended
      end

      def merge_spouse_marriage_history_helpers
        previous_spouses = @form_data['dependents_application']['spouse_marriage_history']

        previous_spouses.each do |spouse|
          # extract middle initial
          spouse['full_name'] = extract_middle_i(spouse, 'full_name')
          # extract spouse marriage history dates
          spouse['start_date'] = split_date(spouse['start_date'])
          spouse['end_date'] = split_date(spouse['end_date'])
        end
      end

      def merge_child_helpers
        children_to_add = @form_data['dependents_application']['children_to_add']

        children_to_add.each do |child|
          # extract middle initial
          child['full_name'] = extract_middle_i(child, 'full_name')

          # extract birth date
          child['birth_date'] = split_date(child['birth_date'])

          # extract ssn
          # @TODO is there a better way to do this?
          ssn = child['ssn']
          child['ssn'] = split_ssn(ssn.delete('-')) unless ssn.blank?

          # extract postal code
          # @TODO is there a better way to do this?
          if !child['does_child_live_with_you']
            child['child_address_info']['address']['postalCode'] = child['child_address_info']['address']['zip_code']
            child['child_address_info']['address']['zip_code'] = split_postal_code(child['child_address_info']['address'])
          end

          # expand child status
          child_status = child['child_status']

          # @TODO child_status = {"biological"=>true}
          # need to check values from FE why is this one coming in differently than the others?
          child['child_status'] = {
            'biological' => child_status['biological'] ? 0 : 'Off',
            'school_age_in_school' => child_status['school_age_in_school'] ? 0 : 'Off',
            'adopted' => child_status['adopted'] ? 0 : 'Off',
            'incapable_self_support' => child_status['incapable_self_support'] ? 0 : 'Off',
            'child_previously_married' => child_status['child_previously_married'] ? 0 : 'Off',
            'stepchild' => child_status['stepchild'] ? 0 : 'Off'
          }

          if child['previously_married'] == 'Yes'
            # extract date
            child['previous_marriage_details']['date_marriage_ended'] = split_date(child['previous_marriage_details']['date_marriage_ended'])

            # expand reason child marriage ended
            reason_marriage_ended = child['previous_marriage_details']['reason_marriage_ended']
            # @TODO confirm option values coming from FE
            child['previous_marriage_details']['reason_marriage_ended'] = {
              'declared_void' => reason_marriage_ended == 'declared_void' ? 0 : 'Off',
              'annulled' => reason_marriage_ended == 'annulled' ? 0 : 'Off',
              'other' => reason_marriage_ended == 'OTHER'? 0 : 'Off'
            }
          end
        end
      end

      def merge_divorce_helpers
        divorce = @form_data['dependents_application']['report_divorce']

        #extract date
        divorce['date'] = split_date(divorce['date'])

        # extract middle initial
        divorce['full_name'] = extract_middle_i(divorce, 'full_name')
      end

      def merge_stepchildren_helpers
        @form_data['dependents_application']['step_children'][0]['address']['postalCode'] =
          @form_data['dependents_application']['step_children'][0]['address']['zip_code']

        @form_data['dependents_application']['step_children'][0]['address']['zip_code'] =
          split_postal_code(@form_data['dependents_application']['step_children'][0]['address'])

        expand_supporting_stepchild
        expand_living_expenses_paid
      end

      def merge_death_helpers
        expand_dependent_type

        @form_data['dependents_application']['deaths'][0]['date'] = split_date(@form_data['dependents_application']['deaths'][0]['date'])
      end

      def merge_child_marriage_helpers
        @form_data['dependents_application']['child_marriage']['date_married'] = split_date(@form_data['dependents_application']['child_marriage']['date_married'])
      end

      def merge_child_stopped_attending_school_helpers
        @form_data['dependents_application']['child_stopped_attending_school']['date_child_left_school'] = split_date(@form_data['dependents_application']['child_stopped_attending_school']['date_child_left_school'])
      end

      def expand_marriage_type
        marriage_type = @form_data['dependents_application']['current_marriage_information']['type']
        @form_data['dependents_application']['current_marriage_information']['type'] = {
          'religious_ceremony' => marriage_type == 'religious_ceremony' ? 1 : 'Off',
          'common_law' => marriage_type == 'common_law' ? 1 : 'Off',
          'tribal' => marriage_type == 'tribal'? 1 : 'Off',
          'proxy' => marriage_type == 'proxy' ? 1 : 'Off',
          'OTHER' => marriage_type == 'OTHER' ? 1 : 'Off'
        }
      end

      def expand_is_veteran
        is_veteran = @form_data['dependents_application']['spouse_information']['is_veteran']
        @form_data['dependents_application']['spouse_information']['is_veteran'] = {
          'is_veteran_yes' => is_veteran ? 1 : 'Off',
          'is_veteran_no' => !is_veteran ? 1 : 'Off'
        }
      end

      def expand_does_live_with_spouse
        does_live_with_spouse = @form_data['dependents_application']['does_live_with_spouse']['spouse_does_live_with_veteran']
        @form_data['dependents_application']['does_live_with_spouse']['spouse_does_live_with_veteran'] = {
          'spouse_does_live_with_veteran_yes' => does_live_with_spouse ? 1 : 'Off',
          'spouse_does_live_with_veteran_no' => !does_live_with_spouse ? 1 : 'Off'
        }
      end

      def expand_reason_marriage_ended
        # @TODO change this loop
        4.times do |i|
          break unless @form_data['dependents_application']['veteran_marriage_history'][i]

          # @TODO reason_marriage_ended = 'report_divorce'???  check values from FE

          reason_marriage_ended = @form_data['dependents_application']['veteran_marriage_history'][i]['reason_marriage_ended']
          # @TODO confirm option values coming from FE
          @form_data['dependents_application']['veteran_marriage_history'][i]['reason_marriage_ended'] = {
            'death' => reason_marriage_ended == 'DEATH' ? 0 : 'Off',
            'divorce' => reason_marriage_ended == 'DIVORCE' ? 0 : 'Off',
            'annulment' => reason_marriage_ended == 'ANNULMENT'? 0 : 'Off',
            'other' => reason_marriage_ended == 'OTHER' ? 0 : 'Off'
          }

          reason_marriage_ended = @form_data['dependents_application']['spouse_marriage_history'][i]['reason_marriage_ended']
          # @TODO confirm option values coming from FE
          @form_data['dependents_application']['spouse_marriage_history'][i]['reason_marriage_ended'] = {
            'death' => reason_marriage_ended == 'DEATH' ? 0 : 'Off',
            'divorce' => reason_marriage_ended == 'DIVORCE' ? 0 : 'Off',
            'annulment' => reason_marriage_ended == 'ANNULMENT'? 0 : 'Off',
            'other' => reason_marriage_ended == 'OTHER' ? 0 : 'Off'
          }
        end
      end

      def expand_supporting_stepchild
        supporting_stepchild = @form_data['dependents_application']['step_children'][0]['supporting_stepchild']
        @form_data['dependents_application']['step_children'][0]['supporting_stepchild'] = {
          'supporting_stepchild_yes' => supporting_stepchild ? 1 : 'Off',
          'supporting_stepchild_no' => !supporting_stepchild ? 1 : 'Off'
        }
      end

      def expand_living_expenses_paid
        living_expenses_paid = @form_data['dependents_application']['step_children'][0]['living_expenses_paid']
        @form_data['dependents_application']['step_children'][0]['living_expenses_paid'] = {
          # @TODO populate array
          # @TODO check these values coming from FE
          'more_than_half' => living_expenses_paid == 'More than half' ? 1 : 'Off',
          'half' => living_expenses_paid == 'Half' ? 1 : 'Off',
          'less_than_half' => living_expenses_paid == 'Less than half' ? 1 : 'Off'
        }
      end

      def expand_dependent_type
        dependent_type = @form_data['dependents_application']['deaths'][0]['dependent_type']
        @form_data['dependents_application']['deaths'][0]['dependent_type'] = {
          # @TODO check these values coming from FE
          # @TODO form says check all that apply
          'minor_child' => dependent_type == 'CHILD' ? 1 : 'Off',
          'stepchild' => dependent_type == 'STEPCHILD' ? 1 : 'Off',
          'adopted' => dependent_type == 'ADOPTED' ? 1 : 'Off',
          'dependent_parent' => dependent_type == 'DEPENDENT_PARENT' ? 1 : 'Off',
          'child_incapable_self_support' => dependent_type == 'child_incapable_self_support' ? 1 : 'Off',
          '18_23_years_old_in_school' => dependent_type == '18_23_years_old_in_school' ? 1 : 'Off',
        }
      end
    end
  end
end

# rubocop:enable Metrics/ClassLength
