---
x-trestle-comp-def-rules:
  appid-D:
    - name: appid_user_profile_updates_from_client_apps_disabled
      description: Ensure App ID user profile updates from client apps is 
        disabled
    - name: appid_cloud_directory_users_account_update_disabled
      description: Ensure App ID Cloud Directory users aren't able to update 
        their own accounts
    - name: appid_cloud_directory_users_selfsign_disabled
      description: Ensure App ID Cloud Directory users aren't able to self-sign 
        up to applications
x-trestle-param-values:
  ac-05_odp:
x-trestle-global:
  profile:
    title: NIST Special Publication 800-53 Revision 5 HIGH IMPACT BASELINE
    href: profiles/acme-profile-nist-800-53/profile.json
  sort-id: ac-05
---

# ac-5 - \[Access Control\] Separation of Duties

## Control Statement

- \[a.\] Identify and document {{ insert: param, ac-05_odp }} ; and

- \[b.\] Define system access authorizations to support separation of duties.

## Control Assessment Objective

- \[AC-05a.\] {{ insert: param, ac-05_odp }} are identified and documented;

- \[AC-05b.\] system access authorizations to support separation of duties are defined.

## Control guidance

Separation of duties addresses the potential for abuse of authorized privileges and helps to reduce the risk of malevolent activity without collusion. Separation of duties includes dividing mission or business functions and support functions among different individuals or roles, conducting system support functions with different individuals, and ensuring that security personnel who administer access control functions do not also administer audit functions. Because separation of duty violations can span systems and application domains, organizations consider the entirety of systems and system components when developing policy on separation of duties. Separation of duties is enforced through the account management activities in [AC-2](#ac-2) , access control mechanisms in [AC-3](#ac-3) , and identity management activities in [IA-2](#ia-2), [IA-4](#ia-4) , and [IA-12](#ia-12).

______________________________________________________________________

## What is the solution and how is it implemented?

<!-- For implementation status enter one of: implemented, partial, planned, alternative, not-applicable -->

<!-- Note that the list of rules under ### Rules: is read-only and changes will not be captured after assembly to JSON -->

<!-- Add control implementation description here for control: ac-5 -->

### Implementation Status: planned

______________________________________________________________________
