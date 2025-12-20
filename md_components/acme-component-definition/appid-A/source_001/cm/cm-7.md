---
x-trestle-comp-def-rules:
  appid-A:
    - name: app_id_cloud_directory_advanced_password_management_is_enabled
      description: Ensure App ID Cloud Directory advanced password management is
        enabled
    - name: app_id_cloud_directory_avoid_password_reuse_policy_is_enabled
      description: Ensure App ID Cloud Directory avoid password reuse policy is 
        enabled
    - name: appid_anonymous_authentication_disabled
      description: Ensure App ID anonymous authentication is disabled
x-trestle-param-values:
  cm-7_prm_2:
  cm-07_odp.01:
  cm-07_odp.02:
  cm-07_odp.03:
  cm-07_odp.04:
  cm-07_odp.05:
  cm-07_odp.06:
x-trestle-global:
  profile:
    title: NIST Special Publication 800-53 Revision 5 HIGH IMPACT BASELINE
    href: profiles/acme-profile-nist-800-53/profile.json
  sort-id: cm-07
---

# cm-7 - \[Configuration Management\] Least Functionality

## Control Statement

- \[a.\] Configure the system to provide only {{ insert: param, cm-07_odp.01 }} ; and

- \[b.\] Prohibit or restrict the use of the following functions, ports, protocols, software, and/or services: {{ insert: param, cm-7_prm_2 }}.

## Control Assessment Objective

- \[CM-07a.\] the system is configured to provide only {{ insert: param, cm-07_odp.01 }};

- \[CM-07b.\]

  - \[CM-07b.[01]\] the use of {{ insert: param, cm-07_odp.02 }} is prohibited or restricted;
  - \[CM-07b.[02]\] the use of {{ insert: param, cm-07_odp.03 }} is prohibited or restricted;
  - \[CM-07b.[03]\] the use of {{ insert: param, cm-07_odp.04 }} is prohibited or restricted;
  - \[CM-07b.[04]\] the use of {{ insert: param, cm-07_odp.05 }} is prohibited or restricted;
  - \[CM-07b.[05]\] the use of {{ insert: param, cm-07_odp.06 }} is prohibited or restricted.

## Control guidance

Systems provide a wide variety of functions and services. Some of the functions and services routinely provided by default may not be necessary to support essential organizational missions, functions, or operations. Additionally, it is sometimes convenient to provide multiple services from a single system component, but doing so increases risk over limiting the services provided by that single component. Where feasible, organizations limit component functionality to a single function per component. Organizations consider removing unused or unnecessary software and disabling unused or unnecessary physical and logical ports and protocols to prevent unauthorized connection of components, transfer of information, and tunneling. Organizations employ network scanning tools, intrusion detection and prevention systems, and end-point protection technologies, such as firewalls and host-based intrusion detection systems, to identify and prevent the use of prohibited functions, protocols, ports, and services. Least functionality can also be achieved as part of the fundamental design and development of the system (see [SA-8](#sa-8), [SC-2](#sc-2) , and [SC-3](#sc-3)).

______________________________________________________________________

## What is the solution and how is it implemented?

<!-- For implementation status enter one of: implemented, partial, planned, alternative, not-applicable -->

<!-- Note that the list of rules under ### Rules: is read-only and changes will not be captured after assembly to JSON -->

<!-- Add control implementation description here for control: cm-7 -->

### Implementation Status: planned

______________________________________________________________________

## Implementation for part a.

<!-- Add control implementation description here for item a. -->

### Rules:

  - appid_anonymous_authentication_disabled

### Implementation Status: planned

______________________________________________________________________

## Implementation for part b.

<!-- Add control implementation description here for item b. -->

### Rules:

  - app_id_cloud_directory_advanced_password_management_is_enabled
  - app_id_cloud_directory_avoid_password_reuse_policy_is_enabled
  - appid_anonymous_authentication_disabled

### Implementation Status: planned

______________________________________________________________________
