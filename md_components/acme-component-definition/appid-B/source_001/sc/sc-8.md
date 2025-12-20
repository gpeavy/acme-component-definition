---
x-trestle-comp-def-rules:
  appid-B:
    - name: appid_webhooks_https_only_configured
      description: Ensure App ID webhooks are using HTTPS only
    - name: appid_email_dispatchers_https_only_configured
      description: Ensure App ID email dispatchers are using HTTPS only
    - name: appid_redirect_uris_https_only_configured
      description: Ensure App ID redirect URIs are using HTTPS only
x-trestle-param-values:
  sc-08_odp:
x-trestle-global:
  profile:
    title: NIST Special Publication 800-53 Revision 5 HIGH IMPACT BASELINE
    href: profiles/acme-profile-nist-800-53/profile.json
  sort-id: sc-08
---

# sc-8 - \[System and Communications Protection\] Transmission Confidentiality and Integrity

## Control Statement

Protect the {{ insert: param, sc-08_odp }} of transmitted information.

## Control Assessment Objective

the {{ insert: param, sc-08_odp }} of transmitted information is/are protected.

## Control guidance

Protecting the confidentiality and integrity of transmitted information applies to internal and external networks as well as any system components that can transmit information, including servers, notebook computers, desktop computers, mobile devices, printers, copiers, scanners, facsimile machines, and radios. Unprotected communication paths are exposed to the possibility of interception and modification. Protecting the confidentiality and integrity of information can be accomplished by physical or logical means. Physical protection can be achieved by using protected distribution systems. A protected distribution system is a wireline or fiber-optics telecommunications system that includes terminals and adequate electromagnetic, acoustical, electrical, and physical controls to permit its use for the unencrypted transmission of classified information. Logical protection can be achieved by employing encryption techniques.

Organizations that rely on commercial providers who offer transmission services as commodity services rather than as fully dedicated services may find it difficult to obtain the necessary assurances regarding the implementation of needed controls for transmission confidentiality and integrity. In such situations, organizations determine what types of confidentiality or integrity services are available in standard, commercial telecommunications service packages. If it is not feasible to obtain the necessary controls and assurances of control effectiveness through appropriate contracting vehicles, organizations can implement appropriate compensating controls.

______________________________________________________________________

## What is the solution and how is it implemented?

<!-- For implementation status enter one of: implemented, partial, planned, alternative, not-applicable -->

<!-- Note that the list of rules under ### Rules: is read-only and changes will not be captured after assembly to JSON -->

<!-- Add control implementation description here for control: sc-8 -->

### Rules:

  - appid_webhooks_https_only_configured
  - appid_email_dispatchers_https_only_configured
  - appid_redirect_uris_https_only_configured

### Implementation Status: planned

______________________________________________________________________
