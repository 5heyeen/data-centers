# Prompt 25: physical-security-tiers

> **Prompt:** [See prompt chain for full text]

---

# Physical Security Engineering Requirements for Data Centers by Security Tier

## 1. Frameworks and Classification Systems

### EN 50600 Physical Security Classes (1–4)

The European standard **EN 50600-1** defines four protection classes for data center physical security, aligned with increasing availability and resilience requirements:

- **Class 1 (Low):** Basic protection against unauthorized access. Simple perimeter fencing, standard locks, basic CCTV. Suitable for small enterprise facilities with no regulatory mandates.
- **Class 2 (Medium):** Controlled access with card-based systems, monitored CCTV, defined security zones. Typical of commercial colocation facilities.
- **Class 3 (High):** Multi-factor access control, mantrap entries, 24/7 security staffing, comprehensive CCTV with extended retention. Aligned with financial services and healthcare requirements.
- **Class 4 (Very High):** Maximum physical security — blast-resistant construction, anti-vehicle barriers, biometric access at every zone boundary, vault-grade server rooms. Required for sovereign/defense and critical national infrastructure.

### TIA-942 Security Zones

TIA-942 defines four concentric security layers (zones), each with escalating controls:

1. **Zone 1 — Site perimeter:** Fencing, vehicle barriers, guard stations, lighting.
2. **Zone 2 — Building shell/lobby:** Hardened exterior, reception/screening, visitor management.
3. **Zone 3 — Operations corridors:** Card + PIN access, CCTV corridors, escort requirements for visitors.
4. **Zone 4 — Data hall/computer room:** Multi-factor biometric access, mantraps, individual cage/vault partitions.

This maps directly to the **concentric ring (defense-in-depth) security model**, where each ring adds an authentication or physical barrier layer, ensuring that breaching one layer does not compromise the asset.

---

## 2. Perimeter Security

### Fencing

- Standard specification: **2.4 m steel palisade fencing** with anti-climb toppings (razor wire or rotating spikes). EN 50600 Class 3–4 facilities often specify **3.0 m fencing** with intrusion detection sensors (taut wire, fibre-optic, or microwave).
- Perimeter intrusion detection systems (PIDS) integrated with CCTV for automated alarm verification.

### Hostile Vehicle Mitigation (HVM)

- **PAS 68 (now superseded by IWA 14-1:2013)** rates vehicle security barriers by the vehicle mass and impact speed they can arrest. A common baseline specification is **a barrier rated to stop a 7,500 kg (7.5-tonne) vehicle traveling at 50 km/h**, corresponding roughly to an N2 classification.
- **IWA 14-1:2013** (the ISO-adopted international standard) uses similar mass/speed ratings and penetration distance classifications (P1 = ≤1 m penetration, P2 = 1–5 m, P3 = 5–15 m). High-security data centers target **P1 rating** — meaning the vehicle is stopped within 1 metre of the barrier line.
- Common barrier types: fixed bollards (219 mm diameter steel, concrete-filled, foundation depth ≥1 m), drop-arm barriers for vehicle lanes, planter-style barriers for aesthetic contexts, and retractable bollards at entry checkpoints.

### Standoff Distance

Class 4 / sovereign facilities aim for a **minimum 30 m standoff distance** between the perimeter fence and the building shell, consistent with US DoD and GSA blast mitigation guidance.

---

## 3. Building Shell Hardening

### Blast Resistance

Two primary standards govern blast-resistant design:

- **GSA ISC (Interagency Security Committee) criteria:** Establishes facility security levels (FSL I–V). Data centers housing federal systems typically require **FSL III–IV**, specifying progressive collapse resistance, blast-resistant glazing, and structural redundancy against vehicle-borne improvised explosive devices (VBIED). The ISC "Design Basis Threat" methodology determines standoff distances and charge weights for structural design.
- **DoD UFC 4-010-01 (Minimum Antiterrorism Standards for Buildings):** Mandates **conventional construction standoff distances** (25 m for inhabited buildings, 10 m for parking) and specifies blast-resistant window systems. For high-risk facilities, it requires **reinforced concrete walls (250–400 mm), blast-rated doors (GSA Level C–D), and structural progressive collapse resistance** per UFC 4-023-03.

### Ballistic Glazing

- Where windows exist (primarily in NOC/SOC areas or office annexes), **EN 1063 BR4 to BR6 glazing** is specified (resistant to 7.62 mm rifle rounds at Class 4).
- Many Class 4 data halls eliminate glazing entirely — windowless construction is the norm for the highest-security white space.

### Wall and Roof Construction

- Reinforced concrete or steel-framed structures with **non-fragmentation cladding**. Roof structures designed to resist forced entry (LPS 1175 SR3–SR5 ratings in the UK framework, or equivalent).

---

## 4. Access Control Systems

### The 5-Factor Progression

High-security data centers implement escalating authentication as personnel move through concentric zones:

| Factor | Description | Typical Zone |
|--------|-------------|--------------|
| **Something you have** | Proximity card / smart card (RFID, DESFire EV2/EV3) | Zone 1–2 perimeter gates, building entry |
| **Something you know** | PIN code (minimum 6-digit) | Zone 2–3 transitions |
| **Something you are** | Biometric — fingerprint, iris scan, or hand geometry | Zone 3–4 transitions |
| **Escort requirement** | Visitor must be accompanied by authorized personnel at all times | Zone 3–4 for non-credentialed persons |
| **Visual verification** | Guard verifies identity against photo ID or live video comparison | Zone 4 / vault entry |

### Mantraps (Airlock / Interlocking Doors)

- Two interlocked doors where only one can be open at a time. Equipped with **anti-tailgating sensors** (infrared beam arrays, weight-sensitive flooring, or overhead stereo cameras such as Boon Edam Lifeline or Speedlane systems).
- EN 50600 Class 3–4 facilities require mantraps at every transition from Zone 2 to Zone 3 and from Zone 3 to Zone 4.

### Anti-Tailgating Measures

- Optical turnstiles with overhead sensors at Zone 2 entry points.
- Full-height security portals (single-person entry cylinders) at Zone 3–4 transitions, ensuring **one credential = one person**.
- Weight-and-count correlation: system alerts if the number of badge reads does not match the count of persons detected.

---

## 5. Internal Zones — Cages, Vaults, and Surveillance

### Cage Partitions

- **Steel mesh cage systems** (commonly from manufacturers such as Minkels, Chatsworth Products, or Cressall) provide tenant isolation in colocation environments. Standard specification: welded wire mesh panels, typically 3.0–3.6 m height, with lockable single or double doors.
- Cages provide visual privacy (mesh density options) and a defined security boundary but are **not rated as vault-grade** enclosures. They are appropriate for EN 50600 Class 2–3 colocation segregation.

### Vault Rooms

- **6-sided steel or reinforced concrete enclosures** (floor, four walls, ceiling) with a single controlled entry point. Designed to meet **UL 2050 Level 3** or equivalent national standards.
- Vault doors: GSA-approved Class 5 vault doors (e.g., Diebold, Hamilton) with Group 1R combination locks, or EN 1143-1 Grade IV–V security doors.
- Required for EN 50600 Class 4, sovereign cloud, defense, and classified (NATO/national) data processing environments.

### CCTV and Surveillance

- **Coverage:** 100% of external perimeter, all entry/exit points, all corridors, all data halls, and all cabinet aisles. No blind spots.
- **Retention:** Industry baseline is **90 days** of continuous recording. Some regulatory regimes (defense, financial services) require **180 days or 1 year**. EN 50600 does not prescribe a specific retention period but references national regulations.
- **Resolution:** Minimum 1080p (Full HD) at entry points and mantraps for facial identification; 720p acceptable for general corridor surveillance.
- **Analytics:** Class 3–4 facilities increasingly deploy AI-based video analytics for anomaly detection (loitering, unauthorized access attempts, object left behind).

---

## 6. Sovereign and Defense Overlay Requirements

Clients in the sovereign cloud, defense, and national security sectors impose requirements **above and beyond** EN 50600 Class 4:

- **Personnel vetting:** Security clearance (e.g., NATO Secret, Norwegian "sikkerhetsklarering" at Hemmelig/Strengt Hemmelig levels) for all persons with unescorted access to Zone 4.
- **TEMPEST/EMSEC shielding:** Faraday cage construction to prevent electromagnetic emanations (per NATO SDIP-27 / AMSG-720B). This adds a literal conductive enclosure (copper or steel mesh) around the data hall.
- **Dual-person integrity (Two-Person Rule):** No single individual may access the most sensitive zones alone; system enforces dual-badge entry.
- **Supply chain security:** All hardware must pass chain-of-custody verification; some jurisdictions require domestic-origin hardware or pre-delivery inspection.
- **Separate network enclaves:** Physically isolated cable pathways, patch panels, and switching infrastructure — no shared conduits between classification levels.
- **National accreditation:** In Norway, facilities handling classified information must be accredited by NSM (Nasjonal sikkerhetsmyndighet) under the Security Act (*sikkerhetsloven*). Similar frameworks exist in every NATO country.

---

## Summary Matrix

| Domain | Class 1–2 | Class 3 | Class 4 / Sovereign |
|--------|-----------|---------|---------------------|
| **Perimeter fencing** | 1.8–2.4 m chain-link | 2.4 m palisade + PIDS | 3.0 m + PIDS + HVM barriers (IWA 14-1) |
| **Vehicle barriers** | Speed bumps / basic gates | PAS 68 bollards (7.5 t @ 40 km/h) | IWA 14-1 P1 rated (7.5 t @ 50+ km/h), 30 m standoff |
| **Building shell** | Standard commercial construction | Reinforced structure, limited glazing | Blast-resistant (UFC 4-010-01), no glazing, progressive collapse design |
| **Access control** | Card + PIN | Card + PIN + biometric, mantraps | 5-factor, mantraps, two-person rule, security-cleared personnel |
| **Internal segregation** | Locked cabinets | Steel mesh cages | 6-sided vault rooms, TEMPEST shielding |
| **CCTV retention** | 30 days | 90 days | 90–365 days, AI analytics |

---

**Key standards referenced:** EN 50600-1:2019, TIA-942-B, PAS 68:2013, IWA 14-1:2013, GSA ISC Security Design Criteria, DoD UFC 4-010-01, UFC 4-023-03, EN 1063 (ballistic glazing), EN 1143-1 (vault doors), UL 2050, NATO SDIP-27, LPS 1175.

---
*Executed: 2026-04-03 | Mode: independent*
