*** Settings ***

Library     ExtendedSelenium2Library
Variables   ../../variables.py

*** Variables ***

${1_DD_ADMIN}                              id=menu_admin_viewAdminModule
${2_DD_USER_MANAGEMENT}                    id=menu_admin_UserManagement
${3_LNK_USERS}                             id=menu_admin_viewSystemUsers
${3_LNK_USER_ROLES}                        id=menu_admin_viewUserRoles
${2_DD_JOB}                                id=menu_admin_Job
${3_LNK_JOB_TITLES}                        id=menu_admin_viewJobTitleList
${3_LNK_SALARY_COMPONENTS}                 id=menu_admin_viewSalaryComponentList
${3_LNK_PAY_GRADES}                        id=menu_admin_viewPayGrades
${3_LNK_EMPLOYMENT_STATUS}                 id=menu_admin_employmentStatus
${3_LNK_JOB_CATEGORIES}                    id=menu_admin_jobCategory
${3_LNK_WORK_SHIFT}                        id=menu_admin_workShift
${2_DD_ORGANIZATION}                       id=menu_admin_Organization
${3_LNK_GENERAL_INFORMATION}               id=menu_admin_viewOrganizationGeneralInformation
${3_LNK_LOCATIONS}                         id=menu_admin_viewLocations
${3_LNK_STRUCTURE}                         id=menu_admin_viewCompanyStructure
${3_LNK_COST_CENTERS}                      id=menu_admin_viewCostCentreList
${3_LNK_PROCESS_EEO_FILING}                id=menu_admin_processEEOFilling
${2_DD_COMPETENCIES}                       id=menu_admin_Competencies
${3_LNK_COMPETENCY_LIST}                   id=menu_admin_getEmployeeCompetencyList
${2_DD_QUALIFICATIONS}                     id=menu_admin_Qualifications
${3_LNK_SKILLS}                            id=menu_admin_viewSkills
${3_LNK_EDUCATION}                         id=menu_admin_viewEducation
${3_LNK_LICENSES}                          id=menu_admin_viewLicenses
${3_LNK_LANGUAGES}                         id=menu_admin_viewLanguages
${3_LNK_MEMBERSHIPS}                       id=menu_admin_membership
${2_LNK_NATIONALITIES}                     id=menu_admin_nationality
${2_DD_ANNOUNCEMENTS}                      id=menu_news_Announcements
${3_LNK_NEWS}                              id=menu_news_viewNewsList
${3_LNK_DOCUMENTS}                         id=menu_news_viewDocumentList
${3_LNK_DOCUMENT_CATEGORIE}                id=menu_news_viewCategoryList
${2_DD_CONFIGURATION_ADM}                  id=menu_admin_Configuration
${3_LNK_EMAIL_SETTINGS}                    id=menu_admin_listMailConfiguration
${3_LNK_EMAIL_NOTIFICATIONS}               id=menu_admin_viewEmailNotification
${3_LNK_LOCALIZATION}                      id=menu_admin_localization
${3_LNK_AUTHENTICATION}                    id=menu_admin_authenticationConfiguration
${3_LNK_DIRECTORY_CONFIGURATION}           id=menu_admin_viewDirectoryConfig
${3_LNK_CANNED_REPORTS}                    id=menu_admin_viewCannedReports
${3_LNK_THEME_COLORS}                      id=menu_admin_themeBuilder
${3_LNK_THEME_IMAGES}                      id=menu_admin_imageUploader
${2_LNK_AUDIT_TRAIL}                       id=menu_audittrail_viewAuditTrail
${1_DD_PIM}                                id=menu_pim_viewPimModule
${2_DD_CONFIGURATION_PIM}                  id=menu_pim_Configuration
${3_LNK_OPTIONAL_FIELDS}                   id=menu_pim_configurePim
${3_LNK_CUSTOM_FIELDS}                     id=menu_pim_viewCustomFieldSectionList
${3_LNK_REPORTING_METHODS}                 id=menu_pim_viewReportingMethods
${3_LNK_ADD_EMPLOYEE_WIZARD}               id=menu_pim_employeeWizardConfiguration
${3_LNK_TERMINATION_REASONS}               id=menu_pim_viewTerminationReasons
${3_LNK_DOCUMENT_TEMPLATES}                id=menu_pim_viewPIMDocumentTemplates
${2_LNK_EMPLOYEE_LIST}                     id=menu_pim_viewEmployeeList
${2_LNK_ADD_EMPLOYEE}                      id=menu_pim_addEmployee
${2_LNK_REPORTS}                           id=menu_pim_viewPimDefinedPredefinedReports
${2_DD_MANAGE_DATA}                        id=menu_pim_ManageData
${3_LNK_BULK_UPDATE}                       id=menu_pim_viewBulkUpdater
${3_LNK_EMPLOYEE_DATA_EXPORT}              id=menu_pim_manageDataEmployeeInformationReport
${1_LNK_MY_INFO}                           id=menu_pim_viewMyDetails
${1_DD_LEAVE}                              id=menu_leave_viewLeaveModule
${2_LNK_APPLY}                             id=menu_leave_applyLeave
${2_LNK_MY_LEAVE}                          id=menu_leave_viewMyLeaveList
${2_DD_ENTITLEMENTS}                       id=menu_leave_Entitlements
${3_LNK_ADD_ENTITLEMENTS}                  id=menu_leave_addLeaveEntitlement
${3_LNK_ENTITLEMENT_LIST}                  id=menu_leave_viewLeaveEntitlements
${3_LNK_MY_ENTITLEMENTS}                   id=menu_leave_viewMyLeaveEntitlements
${2_DD_REPORTS}                            id=menu_leave_Reports
${3_LNK_LEAVE_USAGE}                       id=menu_leave_viewLeaveBalanceReport
${3_LNK_MY_LEAVE_USAGE}                    id=menu_leave_viewMyLeaveBalanceReport
${3_LNK_BRADFORD_FACTOR}                   id=menu_leave_viewBradfordFactorReport
${2_DD_CONFIGURE}                          id=menu_leave_Configure
${3_LNK_LEAVE_PERIOD}                      id=menu_leave_defineLeavePeriod
${3_LNK_LEAVE_TYPES}                       id=menu_leave_leaveTypeList
${3_LNK_WORK_WEEK}                         id=menu_leave_defineWorkWeek
${3_LNK_HOLIDAYS}                          id=menu_leave_viewHolidayList
${3_LNK_BRADFORD_FACTOR_THRESHOLD}         id=menu_leave_bradfordFactorThreshold
${3_LNK_WORKING_WEEKENDS}                  id=menu_leave_viewWorkingWeekendList
${3_LNK_NOTIFICATIONS}                     id=menu_leave_viewLeaveNotifications
${3_LNK_LEAVE_CALENDAR}                    id=menu_leave_leaveCalendarConfiguration
${2_LNK_LEAVE_LIST}                        id=menu_leave_viewLeaveList
${2_LNK_ASIGN_LEAVE}                       id=menu_leave_assignLeave
${2_LNK_LEAVE_CALENDAR}                    id=menu_leave_calendar
${2_LNK_BULK_ASSIGN}                       id=menu_leave_bulkAssignLeave
${1_DD_TIME}                               id=menu_time_viewTimeModule
${2_DD_TIME_SHEETS}                        id=menu_time_Timesheets
${3_LNK_MY_TIME_SHEETS}                    id=menu_time_viewMyTimesheet
${3_LNK_EMPLOYEE_TIME_SHEETS}              id=menu_time_viewEmployeeTimesheet
${3_LNK_EXPORT_TO_CSV}                     id=menu_time_viewTimesheetCsvExtract
${2_DD_ATTENDANCE}                         id=menu_attendance_Attendance
${3_LNK_MY_RECORDS}                        id=menu_attendance_viewMyAttendanceRecord
${3_LNK_PUNCH_IN/OUT}                      id=menu_attendance_punchIn
${3_LNK_EMPLOYEE_RECORDS}                  id=menu_attendance_viewAttendanceRecord
${3_LNK_CONFIGURATION}                     id=menu_attendance_configure
${3_LNK_EXPOTR_TO_CSV}                     id=menu_attendance_viewAttendanceDataExtract
${3_LNK_DATA_UPLOAD}                       id=menu_attendance_AttendanceFileUpload
${2_DD_REPORTS}                            id=menu_time_Reports
${3_LNK_PROJECT_TIME}                      id=menu_time_displayProjectReportCriteria
${3_LNK_EMPLOYEE_PROJECT_TIME}             id=menu_time_displayEmployeeReportCriteria
${3_LNK_PAY_HOURS_REPORT}                  id=menu_time_payCodeReport
${3_LNK_ATTENDANCE_SUMMARY}                id=menu_time_displayAttendanceSummaryReportCriteria
${3_LNK_MONTHLY_ATTENDANCE}                id=menu_time_displayAttendanceDetailsReport
${3_LNK_MY_MONTHLY_ATTENDANCE}             id=menu_time_displayMyAttendanceDetailsReport
${2_DD_ACTIVITY_INFO}                      id=menu_time_ActivityInfo
${3_LNK_CUSTOMERS}                         id=menu_time_viewCustomers
${3_LNK_PROJECTS}                          id=menu_time_viewProjects
${3_LNK_COMMON_ACTIVITIES}                 id=menu_time_commonActivities
${2_DD_CONFIGURATION}                      id=menu_time_Configuration
${3_LNK_TIMESHEET_PERIODS}                 id=menu_time_timesheetPeriods
${1_DD_RECRUITMENT}                        id=menu_recruitment_viewRecruitmentModule
${2_LNK_VACANCIES}                         id=menu_recruitment_viewJobVacancy
${2_LNK_CANDIDATES}                        id=menu_recruitment_viewCandidates
${2_DD_CONFIGURATION}                      id=menu_recruitment_Configuration
${3_LNK_VACANCY_TEMPLATES}                 id=menu_recruitment_vacancyTemplates
${3_LNK_QUESTION_POOL}                     id=menu_recruitment_questionPool
${3_LNK_INTERVIEW_TEMPLATES}               id=menu_recruitment_interviewTemplates
${3_LNK_STANDARD_TESTS}                    id=menu_recruitment_testTemplates
${3_LNK_ANALYTICS}                         id=menu_recruitment_recruitmentAnalyticsConfiguration
${2_LNK_VACANCY_SUCCESSIONS}               id=menu_recruitment_displayVacancySuccessionReportCriteria
${1_DD_DISCIPLINE}                         id=menu_discipline_defaultDisciplinaryView
${2_LNK_DISCIPLINARY_CASES}                id=menu_discipline_viewDisciplinaryCases
${2_LNK_MY_ACTIONS}                        id=menu_discipline_viewMyActions
${2_DD_CONFIGURATION}                      id=menu_discipline_Configuration
${3_LNK_DOCUMENT_TEMPLATES}                id=menu_discipline_viewDisciplinaryDocumentTemplates
${1_DD_TRAINING}                           id=menu_training_defaultTrainingModulePage
${2_LNK_COURSES}                           id=menu_training_viewCourseList
${2_LNK_SESSIONS}                          id=menu_training_viewSessionList
${2_LNK_TRAINING_SESSIONS}                 id=menu_training_viewTrainerSessionList
${2_LNK_PARTICIPATING_SESSIONS}            id=menu_training_viewMyTrainingSessionList
${2_DD_REPORTS}                            id=menu_training_viewTrainingReport
${3_LNK_PARTICIPATING_SESSION}             xpath=//a//span[text()="Participating Session"]
${3_LNK_TRAINING_SESSION}                  xpath=//a//span[text()="Training Session"]
${1_DD_PERFORMANCE}                        id=menu__Performance
${2_DD_EMPLOYEE_TRACKERS}                  id=menu_performanceTracker_EmployeeTrackers
${3_LNK_TRACKER_LIST}                      id=menu_performanceTracker_viewEmployeePerformanceTrackerList
${3_LNK_MY_TRACKERS}                       id=menu_performanceTracker_viewMyPerformanceTrackerList
${3_LNK_MANAGE_TRACKERS}                   id=menu_performanceTracker_addPerformanceTracker
${2_DD_GOALS}                              id=menu_performance_Goals
${3_LNK_MY_GOALS}                          id=menu_performance_myGoals
${3_LNK_GOAL_LIST}                         id=menu_performance_viewEmployeeGoalList
${3_LNK_GOAL_LIBRARY}                      id=menu_performance_goalLibrary
${2_DD_APPRAISALS}                         id=menu_performance_Appraisals
${3_LNK_APPRAISAL_LIST}                    id=menu_performance_viewAllAppraisals
${3_LNK_MY_APPRAISALS}                     id=menu_performance_viewMyAppraisals
${3_LNK_APPRAISAL_CYCLES}                  id=menu_performance_viewAppraisalCycles
${2_DD_CONFIGURATION}                      id=menu_performance_Configuration
${3_LNK_APPRAISAL}                         id=menu_performance_defaultAppraisalConfiguration
${2_LNK_COMPETENCY_PROFILES}               id=menu_performance_competencyProfiles
${2_DD_REPORTS}                            id=menu_performance_Reports
${3_LNK_REVIEW_AND_APPRAISAL_PROGRESS}     id=menu_performance_viewPerformanceReport
${3_LNK_PERFORMANCE_COMPARISON}            id=menu_performance_viewFullComparisonReport
${3_LNK_PERFORMANCE_PROFILE}               id=menu_performance_viewEmployeePerformanceProfile
${3_LNK_PERFORMANCE_PROGRESS}              id=menu_performance_viewPerformanceProgressReport
${3_LNK_EXPORT_PERFORMANCE_DATA}           id=menu_performance_viewPerformanceResultsExport
${1_LEVEL_SUCCESSION_DEVELOPMENT}          id=menu_succession & development_Succession&Development
${2_LNK_INFIVIDUAL_DEVELOPMENT_PLANS}      id=menu_succession & development_individualDevelopmentPlans
${2_LNK_MY_IDP}                            id=menu_succession & development_myDevelopmentPlan
${2_LNK_9_BOX_MATRIX}                      id=menu_succession & development_successionAndDevelopment9Box
${2_DD_CONFIGURATION}                      id=menu_succession & development_Configuration
${3_LNK_9_BOX_MATRIX}                      id=menu_succession & development_successionAndDevelopment9BoxMatrixConfig
${1_DD_ON-BOARDING}                        id=menu_onboarding_defaultMenuView
${2_LNK_TASK_TYPES}                        id=menu_onboarding_viewTaskTypes
${2_LNK_EVENTS}                            id=menu_onboarding_viewJobs
${2_LNK_MY_EVENTS}                         id=menu_onboarding_viewMyJobs
${2_LNK_EMPLOYEE_TASKS}                    id=menu_onboarding_viewEmployeeTasks
${2_LNK_MY_TASKS}                          id=menu_onboarding_viewMyTasks
${2_DD_REPORTS}                            id=menu_onboarding_Reports
${3_LNK_EVENT_PROGRES}                     xpath=//a//span[text()="Event Progress"]
${3_LNK_PARTICIPANT_PROGRES}               xpath=//a//span[text()="Participant Progress"]
${1_LEVEL_EXPENSE}                         id=menu_expense_viewExpenseModule
${2_LEVEL_CONFIGURATION}                   id=menu_expense_Configuration
${3_LEVEL_CURRENCY_EXCHANGE_RATES}         id=menu_expense_viewCurrencyExchangeRate
${3_LEVEL_ELIGILIBILITY_GROUPS}            id=menu_expense_viewEmployeeGroup
${3_LEVEL_EXPENSE_TYPS}                    id=menu_expense_viewExpenseType
${2_LEVEL_TRAVEL_REQUESTS}                 id=menu_expense_TravelRequests
${3_LEVEL_EMPLOYEE_TRAVEL_REQUSTS}         id=menu_expense_viewEmployeeEstimateRequest
${3_LEVEL_MY_TRAVEL_REQUEST}               id=menu_expense_viewEstimateRequest
${2_LEVEL_CLAIMS}                          id=menu_expense_Claims
${3_LEVEL_EMPLOYEE_CLAIMS}                 id=menu_expense_viewExpenseClaims
${3_LEVEL_MY_CLAIMS}                       id=menu_expense_viewMyExpenseClaims
${2_LEVEL_REPORTS}                         id=menu_expense_travelRequestReport
${1_LNK_REPORTS_CATALOG}                   id=menu_admin_reportsCatalog
${1_DD_MORE}                               id=menu_news_More
${2_LNK_ANNOUNCEMENTS}                     id=menu_news_viewAnnouncementModule
${2_LNK_DASHBOARD}                         id=menu_dashboard_index
${2_LNK_BUZZ}                              id=menu_buzz_viewBuzz
${2_LNK_DIRECTORY}                         id=menu_directory_viewDirectory
${2_DD_ORGANIZATION_CHART}                 id=menu_orgChart_OrganizationChart
${3_LNK_CONFIG}                            id=menu_orgChart_configReportingMethod
${3_LNK_DEFINE_POSITION}                   id=menu_orgChart_defineJobTitleHierarchy
${3_LNK_VIEW}                              id=menu_orgChart_orgchartView
${2_LNK_PREFERENCES}                       id=menu_admin_userConfiguration
${2_DD_ASSETS}                             id=menu_asset_viewUserAssetList   #xpath=//span[text()="Assets"]//parent::a
${3_LNK_VIEW_ASSETS}                       id=menu_asset_viewAssets
${3_LNK_BRANDS}                            id=menu_asset_viewBrands
${3_LNK_CATEGORIES}                        id=menu_asset_viewCategories
${3_LNK_VENDORS}                           id=menu_asset_viewVendorList
${1_DD_MAINTENANCE}                        id=menu__Maintenance
${2_DD_PURGE_RECORDS}                      id=menu_Maintenance_PurgeRecords
${3_LNK_EMPLOYEE_RECORDS}                  id=menu_Maintenance_maintenancePurgeEmployeeRecords
${3_LNK_CANDIDATE_RECORDS}                 id=menu_Maintenance_maintenancePurgeCandidateRecords

*** Keywords ***

Navigate to:
      [Documentation]         Navigates to User Roles in main menu
      [Arguments]             @{MENU_LIST}
      FOR    ${element}   IN  @{MENU_LIST}
      click element           ${element}
      END
      wait until angular ready


Navigate to Users
    [Documentation]           Navigates to Users in main menu
    Navigate to:              ${1_DD_ADMIN}     ${2_DD_USER_MANAGEMENT}     ${3_LNK_USERS}

Navigate to User Roles
    [Documentation]           Navigates to User Roles in main menu
    Navigate to:              ${1_DD_ADMIN}   ${2_DD_USER_MANAGEMENT}   ${3_LNK_USER_ROLES}

Navigate to Job Titles
    [Documentation]           Navigate to Job Titles in main menu
    Navigate to:              ${1_DD_ADMIN}  ${2_DD_JOB}  ${3_LNK_JOB_TITLES}

Navigate to Salary Components
    [Documentation]           Navigate to Salary Components in main menu
    Navigate to:              ${1_DD_ADMIN}  ${2_DD_JOB}  ${3_LNK_SALARY_COMPONENTS}

Navigate to Pay Grades
    [Documentation]           Navigate to Pay Grades in main menu
    Navigate to:              ${1_DD_ADMIN}  ${2_DD_JOB}  ${3_LNK_PAY_GRADES}

Navigate to Employment Status
    [Documentation]           Navigate to Employment Ststus in main menu
    Navigate to:              ${1_DD_ADMIN}  ${2_DD_JOB}  ${3_LNK_EMPLOYMENT_STATUS}

Navigate to Job Categories
    [Documentation]           Navigate to Job Categories in main menu
    Navigate to:              ${1_DD_ADMIN}  ${2_DD_JOB}  ${3_LNK_JOB_CATEGORIES}

Navigate to Work Shift
    [Documentation]           Navigate to Work Shift in main menu
    Navigate to:              ${1_DD_ADMIN}  ${2_DD_JOB}  ${3_LNK_WORK_SHIFT}

Navigate to General Information
    [Documentation]           Navigate to General Information in main menu
    Navigate to:              ${1_DD_ADMIN}  ${2_DD_ORGANIZATION}  ${3_LNK_GENERAL_INFORMATION}

Navigate to Locations
    [Documentation]           Navigate to Locations in main menu
    Navigate to:              ${1_DD_ADMIN}  ${2_DD_ORGANIZATION}  ${3_LNK_LOCATIONS}

Navigate to Structure
    [Documentation]           Navigate to Structure in main menu
    Navigate to:              ${1_DD_ADMIN}  ${2_DD_ORGANIZATION}  ${3_LNK_STRUCTURE}

Navigate to Cost Centers
    [Documentation]           Navigate to Cost Centers in main menu
    Navigate to:              ${1_DD_ADMIN}  ${2_DD_ORGANIZATION}  ${3_LNK_COST_CENTERS}

Navigate to process EEO Filing
    [Documentation]           Navigate to Process EEO Filing in main menu
    Navigate to:              ${1_DD_ADMIN}  ${2_DD_ORGANIZATION}  ${3_LNK_PROCESS_EEO_FILING}

Navigate to Competency List
    [Documentation]           Navigate to Competency List in main menu
    Navigate to:              ${1_DD_ADMIN}  ${2_DD_COMPETENCIES}  ${3_LNK_COMPETENCY_LIST}

Navigate to Skills
    [Documentation]           Navigate to Skills in main menu
    Navigate to:              ${1_DD_ADMIN}  ${2_DD_QUALIFICATIONS}   ${3_LNK_SKILLS}

Navigate to Education
    [Documentation]           Navigate to Education in main menu
    Navigate to:              ${1_DD_ADMIN}  ${2_DD_QUALIFICATIONS}   ${3_LNK_EDUCATION}

Navigate to Licenses
    [Documentation]           Navigate to Licenses in main menu
    Navigate to:              ${1_DD_ADMIN}  ${2_DD_QUALIFICATIONS}   ${3_LNK_LICENSES}

Navigate to Languages
    [Documentation]           Navigate to Languages in main menu
    Navigate to:              ${1_DD_ADMIN}  ${2_DD_QUALIFICATIONS}   ${3_LNK_LANGUAGES}

Navigate to Memberships
    [Documentation]           Navigate to Licenses in main menu
    Navigate to:              ${1_DD_ADMIN}  ${2_DD_QUALIFICATIONS}   ${3_LNK_MEMBERSHIPS}

Navigate to Nationalities
    [Documentation]           Navigate to Nationalities in main menu
    Navigate to:              ${1_DD_ADMIN}  ${2_LNK_NATIONALITIES}

Navigate to News
    [Documentation]           Navigate to News in main menu
    Navigate to:              ${1_DD_ADMIN}  ${2_DD_ANNOUNCEMENTS}   ${3_LNK_NEWS}

Navigate to Documents
    [Documentation]           Navigate to Documents in main menu
    Navigate to:              ${1_DD_ADMIN}  ${2_DD_ANNOUNCEMENTS}   ${3_LNK_DOCUMENTS}

Navigate to Document Categorie
    [Documentation]           Navigate to Document Categorie in main menu
    Navigate to:              ${1_DD_ADMIN}  ${2_DD_ANNOUNCEMENTS}   ${3_LNK_DOCUMENT_CATEGORIE}

Navigate to Email Settings
    [Documentation]           Navigate to Emil Settings in main menu
    Navigate to:              ${1_DD_ADMIN}  ${2_DD_CONFIGURATION_ADM}   ${3_LNK_EMAIL_SETTINGS}

Navigate to Email Notifications
    [Documentation]           Navigate to Emil Notifications in main menu
    Navigate to:              ${1_DD_ADMIN}  ${2_DD_CONFIGURATION_ADM}   ${3_LNK_EMAIL_NOTIFICATIONS}

Navigate to Localization
    [Documentation]           Navigate to Localization in main menu
    Navigate to:              ${1_DD_ADMIN}  ${2_DD_CONFIGURATION_ADM}   ${3_LNK_LOCALIZATION}

Navigate to Authentication
    [Documentation]           Navigate to Authentication in main menu
    Navigate to:              ${1_DD_ADMIN}  ${2_DD_CONFIGURATION_ADM}   ${3_LNK_AUTHENTICATION}

Navigate to Directory Configuration
    [Documentation]           Navigate to Directory Configuration in main menu
    Navigate to:              ${1_DD_ADMIN}  ${2_DD_CONFIGURATION_ADM}   ${3_LNK_DIRECTORY_CONFIGURATION}

Navigate to Canned Reports
    [Documentation]           Navigate to Canned Reports in main menu
    Navigate to:              ${1_DD_ADMIN}  ${2_DD_CONFIGURATION_ADM}   ${3_LNK_CANNED_REPORTS}

Navigate to Theme Colors
    [Documentation]           Navigate to Theme Colors in main menu
    Navigate to:              ${1_DD_ADMIN}  ${2_DD_CONFIGURATION_ADM}   ${3_LNK_THEME_COLORS}

Navigate to Theme Images
    [Documentation]           Navigate to Theme Images in main menu
    Navigate to:              ${1_DD_ADMIN}  ${2_DD_CONFIGURATION_ADM}   ${3_LNK_THEME_IMAGES}

Navigate to Audit Trail
    [Documentation]           Navigate to Audit Trail in maini menu
    Navigate to:              ${1_DD_ADMIN}  ${2_LNK_AUDIT_TRAIL}

Navigate to Optional Fields
    [Documentation]           Navigate to Optional Fields in main menu
    Navigate to:              ${1_DD_PIM}  ${2_DD_CONFIGURATION_PIM}   ${3_LNK_OPTIONAL_FIELDS}

Navigate to Custom Fields
    [Documentation]           Navigate to Custom Fields in main menu
    Navigate to:              ${1_DD_PIM}  ${2_DD_CONFIGURATION_PIM}   ${3_LNK_CUSTOM_FIELDS}

Navigate to Reporting Methods
    [Documentation]           Navigate to Reporting Methods in main menu
    Navigate to:              ${1_DD_PIM}  ${2_DD_CONFIGURATION_PIM}   ${3_LNK_REPORTING_METHODS}

Navigate to Add Employee Wizard
    [Documentation]           Navigate to Add Employee Wizard in main menu
    Navigate to:              ${1_DD_PIM}  ${2_DD_CONFIGURATION_PIM}   ${3_LNK_ADD_EMPLOYEE_WIZARD}

Navigate to Termination Reasons
    [Documentation]           Navigate to Termination Reasons in main menu
    Navigate to:              ${1_DD_PIM}  ${2_DD_CONFIGURATION_PIM}   ${3_LNK_TERMINATION_REASONS}

Navigate to Document Templates
    [Documentation]           Navigate to Document Templates in main menu
    Navigate to:              ${1_DD_PIM}  ${2_DD_CONFIGURATION_PIM}   ${3_LNK_DOCUMENT_TEMPLATES}

Navigate to Employee List
    [Documentation]           Navigate to Employee List in main menu
    Navigate to:              ${1_DD_PIM}  ${2_LNK_EMPLOYEE_LIST}

Navigate to Add Employee
    [Documentation]           Navigate to Add Employee in main menu
    Navigate to:              ${1_DD_PIM}  ${2_LNK_EMPLOYEE_LIST}

Navigate to Reports
    [Documentation]           Navigate to Reports in main menu
    Navigate to:              ${1_DD_PIM}  ${2_LNK_REPORTS}

Navigate to Bulk Update
    [Documentation]           Navigate to Bulk Update in main menu
    Navigate to:              ${1_DD_PIM}  ${2_DD_MANAGE_DATA}   ${3_LNK_BULK_UPDATE}

Navigate to Employee Data Export
    [Documentation]           Navigate to Employee Data Export in main menu
    Navigate to:              ${1_DD_PIM}  ${2_DD_MANAGE_DATA}   ${3_LNK_EMPLOYEE_DATA_EXPORT}

Navigate to My Info
    [Documentation]           Navigate to My Info in main menu
    Navigate to:              ${1_LNK_MY_INFO}

Navigate to More
    [Documentation]           Navigates to More in main menu
    Navigate to:              ${1_DD_MORE}

Navigate to Brands
    [Documentation]           Navigates to Brands in main menu
    Navigate to:              ${2_DD_ASSETS}   ${3_LNK_BRANDS}

Navigate to Vendors
    [Documentation]           Navigates to vendors in main menu
    Navigate to:              ${2_DD_ASSETS}   ${3_LNK_VENDORS}

