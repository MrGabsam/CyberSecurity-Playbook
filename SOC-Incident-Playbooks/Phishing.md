# Phishing Playbook

**Author:** Gabriel Mumo Samuel  
**Role:** Global Cybersecurity Expert | SOC Leader | AI in Security Innovator  

---

## Overview
A rigorous guide to detecting, investigating, and neutralising sophisticated phishing campaigns targeting users via email, SMS, or malicious links.

---

## Indicators of Compromise (IoCs)
- Spoofed or recently registered sender domains matching legitimate brands  
- URLs where display text and actual link diverge  
- Unexpected or obfuscated attachments (`.exe`, `.js`, `.zip`)  
- Urgent or fear-inducing language (e.g., “Immediate action required…”)

---

## Detection Techniques
1. **Email Header Forensics**  
   - Analyse SPF, DKIM & DMARC results for domain spoofing.  
2. **Automated URL Sandboxing**  
   - Execute links in isolated environments and log redirect/ payload behavior.  
3. **Attachment Threat Intelligence**  
   - Hash‐based lookups against VirusTotal and internal intelligence feeds.  
4. **User-Driven Reporting**  
   - Integrated phishing submission workflows and feedback loops from end users.

---

## Investigation Steps
1. **Collect** raw email headers and decode any encoded fields.  
2. **Extract & Execute** suspicious URLs/attachments in a sandbox; log network calls and system changes.  
3. **Correlate** with SIEM events (DNS queries, proxy logs, endpoint alerts).  
4. **Interview** affected users to reconstruct the attack timeline and understand lure tactics.

---

## Containment & Eradication
- **Block** malicious domains/IPs at the email gateway and DNS layers.  
- **Quarantine** or delete all identified phishing emails from user mailboxes.  
- **Reset** compromised credentials and enforce multi-factor authentication (MFA).  
- **Update** and deploy enhanced phishing-awareness training modules and simulations.

---

## Recovery
- **Monitor** for resurgence of similar campaigns using updated IoCs.  
- **Validate** block effectiveness by reviewing gateway‐filter metrics.  
- **Refine** email filtering rules and thresholds based on new threat intelligence.  
- **Conduct** a formal post‐incident review and share lessons learned with stakeholders.

---

*Last updated: 05/07/2023*  

