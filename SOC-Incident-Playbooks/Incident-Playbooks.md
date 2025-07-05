# Incident Response Playbooks by Gabriel Mumo Samuel

**Global Cybersecurity Expert | SOC Leader | AI in Security Innovator**

With over a decade of hands-on experience in Security Operations, threat hunting, and AI-driven defence strategies, I have authored and refined incident response methodologies that protect leading organisations worldwide. This repository demonstrates my mastery of technical detection, behavioural analysis, and policy design—key pillars that underpin my application for the Global Talent Visa.

---

# Phishing Playbook

## Overview

A rigorous guide to detecting, investigating, and neutralising sophisticated phishing campaigns targeting users via email, SMS, or malicious links.

## Indicators of Compromise (IoCs)

* Spoofed or recently registered sender domains matching legitimate brands
* URLs where display text and actual link diverge
* Unexpected or obfuscated attachments (.exe, .js, .zip)
* Urgent or fear-inducing language ("Immediate action required...")

## Detection Techniques

1. **Email Header Forensics**: Analyse SPF, DKIM, and DMARC results for domain spoofing.
2. **Automated URL Sandboxing**: Run URLs in isolated environments to observe redirect and payload behaviour.
3. **Attachment Threat Intelligence**: Hash-based lookups against VirusTotal and proprietary intelligence feeds.
4. **User-Driven Reporting**: Integrated phishing submission workflows and feedback loops.

## Investigation Steps

1. Collect raw email headers and decode any encoded fields.
2. Extract and execute URLs/attachments in a sandbox; log network calls and system modifications.
3. Correlate SIEM events: DNS queries, web proxy logs, endpoint alerts.
4. Conduct structured interviews with affected users to reconstruct the attack timeline.

## Containment & Eradication

* **Block** suspicious domains/IPs at email gateway and DNS layers.
* **Quarantine** detected phishing emails and perform bulk deletion.
* **Reset** compromised credentials and enforce multi-factor authentication.
* **Update** awareness training and phishing simulation exercises.

## Recovery

* Monitor for resurgence of similar campaigns.
* Analyse gateway-filter metrics to confirm block efficacy.
* Refine email filtering rules based on new IOCs.
* Conduct post-incident review and share lessons learned with stakeholders.

---

# Malware Playbook

## Overview

Comprehensive procedures for detecting, responding to, and remediating malware infections on endpoints and servers.

## Indicators of Compromise (IoCs)

* Unauthorised process creation or DLL injection
* Sudden spikes in CPU/memory or network traffic
* Presence of known malicious file hashes or registry keys
* Alerts from Endpoint Detection and Response (EDR) platforms

## Detection Techniques

1. **EDR Telemetry**: Real-time monitoring of process and file behaviours.
2. **File Integrity Monitoring**: Hash-based tracking of critical system files.
3. **Network Anomaly Detection**: Identify unusual data exfiltration or C2 communications.
4. **Host Forensics**: Analyse auto-start locations, scheduled tasks, and registry changes.

## Investigation Steps

1. **Isolate** suspected hosts to prevent lateral movement.
2. **Acquire** memory and disk images for detailed forensic analysis.
3. **Identify** malicious artefacts, persistence mechanisms, and C2 infrastructure.
4. **Trace** attacker actions using EDR logs and network captures.

## Containment & Eradication

* **Quarantine** or rebuild compromised machines.
* **Remove** malware samples and disable persistence.
* **Patch** exploited vulnerabilities and update signatures.
* **Deploy** updated YARA rules and EDR policies.

## Recovery

* **Reimage** systems from known good backups.
* **Validate** integrity of restored data and applications.
* **Conduct** infrastructure hardening and user briefings.
* **Review** incident post-mortem to strengthen controls.

---

# Privilege Abuse Playbook

## Overview

Best practices for detecting and mitigating misuse of elevated permissions by insiders or external attackers.

## Indicators of Compromise (IoCs)

* Out-of-hours administrative logins from unfamiliar IPs
* Creation or elevation of privileged accounts without change requests
* Bulk modifications to access control lists (ACLs)
* Execution of sensitive commands (e.g., `net user /add`, `Enable-PSRemoting`)

## Detection Techniques

1. **SIEM Rules**: Alert on atypical admin logins by time, geography, or device.
2. **AD Audit Logs**: Monitor AccountManagement events for account creation and group changes.
3. **Endpoint Process Monitoring**: Track PowerShell and `cmd.exe` usage with high privileges.
4. **Session Recording**: Review recordings of privileged sessions (if available).

## Investigation Steps

1. **Identify** the source of privileged actions (user, host, time).
2. **Audit** all recent changes to user accounts and group memberships.
3. **Interview** the user or stakeholder to validate legitimacy.
4. **Cross-reference** with threat intelligence on compromised credentials.

## Containment & Eradication

* **Disable/Rotate** compromised credentials immediately.
* **Revoke** unauthorized group memberships.
* **Enforce** MFA and just-in-time privileged access controls.
* **Harden** administrative hosts with least-privilege policies.

## Recovery

* **Restore** correct permission sets and document changes.
* **Train** users on policy and approval workflows for admin tasks.
* **Tune** detection rules to reduce false positives and catch anomalies early.

---

# Additional Playbooks

* **Data Exfiltration**: Monitor large-scale data transfers, anomalous SMB or FTP activity, DLP policy violations.
* **Insider Threat**: Baseline normal user behaviours, detect abrupt deviations, and intervene with user outreach.
* **Credential Stuffing**: Detect rapid login failures, monitor IP reputation, implement lockouts and CAPTCHAs.
* **Ransomware Response**: Validate backup integrity, isolate encryption sources, engage decryption solutions, and negotiate where necessary.


