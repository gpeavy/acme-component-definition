---
x-trestle-comp-def-rules:
  appid-D:
    - name: appid_cloud_directory_users_account_update_disabled
      description: Ensure App ID Cloud Directory users aren't able to update 
        their own accounts
x-trestle-global:
  profile:
    title: NIST Special Publication 800-53 Revision 5 HIGH IMPACT BASELINE
    href: profiles/acme-profile-nist-800-53/profile.json
  sort-id: ac-06
---

# ac-6 - \[Access Control\] Least Privilege

## Control Statement

Employ the principle of least privilege, allowing only authorized accesses for users (or processes acting on behalf of users) that are necessary to accomplish assigned organizational tasks.

## Control Assessment Objective

the principle of least privilege is employed, allowing only authorized accesses for users (or processes acting on behalf of users) that are necessary to accomplish assigned organizational tasks.

## Control guidance

Organizations employ least privilege for specific duties and systems. The principle of least privilege is also applied to system processes, ensuring that the processes have access to systems and operate at privilege levels no higher than necessary to accomplish organizational missions or business functions. Organizations consider the creation of additional processes, roles, and accounts as necessary to achieve least privilege. Organizations apply least privilege to the development, implementation, and operation of organizational systems.

______________________________________________________________________

## What is the solution and how is it implemented?

<!-- For implementation status enter one of: implemented, partial, planned, alternative, not-applicable -->

<!-- Note that the list of rules under ### Rules: is read-only and changes will not be captured after assembly to JSON -->

<!-- Add control implementation description here for control: ac-6 -->

### Rules:

  - appid_cloud_directory_users_account_update_disabled

### Implementation Status: planned

______________________________________________________________________
