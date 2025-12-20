---
x-trestle-comp-def-rules:
  appid-A:
    - name: 
        app_id_cloud_directory_lockout_policy_after_failed_of_signin_attempts_is_enabled
      description: 'Ensure App ID Cloud Directory lockout policy after failed # of
        sign-in attempts is enabled'
    - name: app_id_cloud_directory_advanced_password_management_is_enabled
      description: Ensure App ID Cloud Directory advanced password management is
        enabled
    - name: app_id_cloud_directory_avoid_password_reuse_policy_is_enabled
      description: Ensure App ID Cloud Directory avoid password reuse policy is 
        enabled
    - name: app_id_cloud_directory_lockout_period_is_set_to_at_least_minutes
      description: 'Ensure App ID Cloud Directory lockout period is set to at least
        # minute(s)'
x-trestle-rules-params:
  appid-A:
    - name: lockout_policy_config_minutes
      description: Lockout duration policy setting in minutes
      options: ''
      rule-id: app_id_cloud_directory_lockout_period_is_set_to_at_least_minutes
x-trestle-comp-def-rules-param-vals:
  # You may set new values for rule parameters by adding
  #
  # component-values:
  #   - value 1
  #   - value 2
  #
  # below a section of values:
  # The values list refers to the values as set by the components, and the component-values are the new values
  # to be placed in SetParameters of the component definition.
  #
  appid-A:
    - name: lockout_policy_config_minutes
      values:
        - '15'
x-trestle-param-values:
  ac-07_odp.01:
  ac-07_odp.02:
  ac-07_odp.03:
  ac-07_odp.04:
  ac-07_odp.05:
  ac-07_odp.06:
x-trestle-global:
  profile:
    title: NIST Special Publication 800-53 Revision 5 HIGH IMPACT BASELINE
    href: profiles/acme-profile-nist-800-53/profile.json
  sort-id: ac-07
---

# ac-7 - \[Access Control\] Unsuccessful Logon Attempts

## Control Statement

- \[a.\] Enforce a limit of {{ insert: param, ac-07_odp.01 }} consecutive invalid logon attempts by a user during a {{ insert: param, ac-07_odp.02 }} ; and

- \[b.\] Automatically {{ insert: param, ac-07_odp.03 }} when the maximum number of unsuccessful attempts is exceeded.

## Control Assessment Objective

- \[AC-07a.\] a limit of {{ insert: param, ac-07_odp.01 }} consecutive invalid logon attempts by a user during {{ insert: param, ac-07_odp.02 }} is enforced;

- \[AC-07b.\] automatically {{ insert: param, ac-07_odp.03 }} when the maximum number of unsuccessful attempts is exceeded.

## Control guidance

The need to limit unsuccessful logon attempts and take subsequent action when the maximum number of attempts is exceeded applies regardless of whether the logon occurs via a local or network connection. Due to the potential for denial of service, automatic lockouts initiated by systems are usually temporary and automatically release after a predetermined, organization-defined time period. If a delay algorithm is selected, organizations may employ different algorithms for different components of the system based on the capabilities of those components. Responses to unsuccessful logon attempts may be implemented at the operating system and the application levels. Organization-defined actions that may be taken when the number of allowed consecutive invalid logon attempts is exceeded include prompting the user to answer a secret question in addition to the username and password, invoking a lockdown mode with limited user capabilities (instead of full lockout), allowing users to only logon from specified Internet Protocol (IP) addresses, requiring a CAPTCHA to prevent automated attacks, or applying user profiles such as location, time of day, IP address, device, or Media Access Control (MAC) address. If automatic system lockout or execution of a delay algorithm is not implemented in support of the availability objective, organizations consider a combination of other actions to help prevent brute force attacks. In addition to the above, organizations can prompt users to respond to a secret question before the number of allowed unsuccessful logon attempts is exceeded. Automatically unlocking an account after a specified period of time is generally not permitted. However, exceptions may be required based on operational mission or need.

______________________________________________________________________

## What is the solution and how is it implemented?

<!-- For implementation status enter one of: implemented, partial, planned, alternative, not-applicable -->

<!-- Note that the list of rules under ### Rules: is read-only and changes will not be captured after assembly to JSON -->

<!-- Add control implementation description here for control: ac-7 -->

### Implementation Status: planned

______________________________________________________________________

## Implementation for part a.

<!-- Add control implementation description here for item a. -->

### Rules:

  - app_id_cloud_directory_lockout_policy_after_failed_of_signin_attempts_is_enabled
  - app_id_cloud_directory_advanced_password_management_is_enabled
  - app_id_cloud_directory_avoid_password_reuse_policy_is_enabled

### Implementation Status: planned

______________________________________________________________________

## Implementation for part b.

<!-- Add control implementation description here for item b. -->

### Rules:

  - app_id_cloud_directory_advanced_password_management_is_enabled
  - app_id_cloud_directory_avoid_password_reuse_policy_is_enabled
  - app_id_cloud_directory_lockout_period_is_set_to_at_least_minutes

### Implementation Status: planned

______________________________________________________________________
