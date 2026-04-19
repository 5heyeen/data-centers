# Prompt 26: tempest-emsec-shielding

> **Prompt:** [See prompt chain for full text]

---

# TEMPEST/EMSEC Shielding in Data Center Design

## What Is TEMPEST?

TEMPEST — an acronym for **Telecommunications Electronics Material Protected from Emanating Spurious Transmissions** — refers to the study and mitigation of compromising emanations (CE): unintentional electromagnetic signals emitted by electronic equipment that can be intercepted and reconstructed to extract classified information. The threat was first identified by the U.S. and UK intelligence communities in the 1950s, and the term now broadly covers both the vulnerability and the countermeasures against it.

**EMSEC (Emissions Security)** is the formal discipline within information security that addresses these risks. TEMPEST is essentially the implementation standard for EMSEC controls.

## NATO SDIP-27 Zone Classifications

The governing NATO standard is **SDIP-27** (formerly AMSG-720B), which defines three shielding zones based on required signal attenuation:

| Zone | NATO Designation | Attenuation Requirement | Typical Use Case |
|------|-----------------|------------------------|-------------------|
| **Zone A** | SDIP-27 Level A (AMSG-720B) | ~100 dB across 1 MHz–10 GHz | Equipment processing NATO SECRET and above; assumes adversary is immediately adjacent (0 m) |
| **Zone B** | SDIP-27 Level B | ~60–80 dB | Equipment in controlled facilities; assumes 20 m minimum separation from uncontrolled space |
| **Zone C** | SDIP-27 Level C | ~40–60 dB | Lower-classification environments; assumes 100 m separation or use within already-secured perimeters |

The U.S. equivalent standards are maintained by the NSA under the classified **NSTISSAM TEMPEST/1-92** and the unclassified **CNSSAM TEMPEST/01-02**. National standards in NATO countries (e.g., Norway's NSM guidelines) typically reference SDIP-27 directly.

## Engineering Requirements

### Shielded Enclosure (Faraday Cage)

The core of a TEMPEST room is a **continuously welded steel or copper enclosure** forming a complete Faraday cage. Key specifications:

- **Material**: Typically 2–3 mm galvanized steel panels or 0.5–1 mm copper sheet, continuously welded at all seams — bolted joints with conductive gaskets are acceptable for Zone B/C but Zone A generally requires full weld continuity.
- **Attenuation target**: 60–100 dB across the frequency range of 10 kHz to 10 GHz (Zone A demands the upper end).
- **Floor and ceiling**: The shield must be a complete six-sided enclosure, including floor plates welded to wall panels. Raised floors inside the shielded room sit *within* the cage.

### Waveguide Ventilation Penetrations

Airflow is critical in data centers, but any opening in the shield is a potential RF leak. The solution is **honeycomb waveguide panels**:

- Hexagonal or circular tubes, typically 10–20 mm diameter and 40–80 mm deep, arranged in a honeycomb matrix.
- These act as **waveguides below cutoff** — RF energy at frequencies below the cutoff frequency of the tube geometry is exponentially attenuated, while air passes freely.
- A standard honeycomb panel achieves **80–100 dB attenuation** above 1 GHz while permitting adequate airflow for cooling.
- Panels must be conductively bonded to the enclosure walls with continuous RF gaskets.

### Filtered Power Entry

Every electrical conductor penetrating the shield is a potential antenna. **EMI/RFI power line filters** are installed at the shield boundary:

- Filters are rated to match the enclosure's attenuation (e.g., 100 dB insertion loss for Zone A).
- Filters are mounted in **filtered power entry panels** welded directly into the shield wall, ensuring no unfiltered conductor crosses the boundary.
- Both mains power and UPS feeds require filtering. Signal lines (if copper is unavoidable) require individual filtered connectors.

### Data Entry: Fiber Only

Best practice for TEMPEST facilities is **fiber-optic-only data entry** — optical fiber does not conduct electromagnetic signals and cannot act as an emanation path. Copper Ethernet or coaxial penetrations are avoided entirely or, where unavoidable, passed through high-performance filtered connectors with attenuation matching the room rating.

### Shielded Doors

TEMPEST-rated doors use:

- **Knife-edge contacts** or **beryllium copper finger stock gaskets** around the entire door perimeter.
- Double-door vestibule configurations for Zone A installations.
- Typical door attenuation: 80–100 dB when properly maintained. Gasket wear is a major maintenance concern — annual or semi-annual RF leakage testing is standard.

## Cost Implications

TEMPEST rooms are dramatically more expensive than standard data halls:

- **5–10x cost per square meter** compared to a conventional server room, driven by the welded enclosure, specialized HVAC penetrations, filtered power, and ongoing certification testing.
- A standard data hall might cost €3,000–5,000/m²; a Zone A TEMPEST room can reach **€25,000–50,000/m²** fully fitted.
- **Ongoing costs** include periodic RF leakage surveys (typically using IEEE 299 / NSA 94-106 test methods), gasket replacement, and filter maintenance.

## Who Requires TEMPEST?

TEMPEST shielding is mandated for facilities processing classified information:

- **Military and defense**: NATO SECRET, national TOP SECRET, and compartmented (SCI) programs.
- **Intelligence agencies**: NSA, GCHQ, Norwegian NSM/E-tjenesten, and allied services.
- **Government agencies**: Ministries of defense, foreign affairs, and justice when handling classified material.
- **Defense contractors**: When processing classified data under facility security clearance (FSC) requirements.

In Norway specifically, the **National Security Authority (NSM)** sets TEMPEST requirements for facilities handling information classified under the *Sikkerhetsloven* (Security Act). Any data center hosting *BEGRENSET* (RESTRICTED) and above may face EMSEC requirements, with full TEMPEST shielding mandatory at *HEMMELIG* (SECRET) and *STRENGT HEMMELIG* (TOP SECRET) levels.

## Relevance to Data Center Design

For data center operators serving government or defense tenants, TEMPEST requirements fundamentally alter the facility design:

- Standard open data halls cannot be used; dedicated **shielded rooms or cages** must be integrated into the floor plan.
- HVAC routing must accommodate waveguide panels, reducing effective airflow and potentially requiring supplemental cooling.
- Power distribution requires additional space and cost for filter banks.
- The facility must support **periodic certification testing**, requiring access to all shield surfaces.

TEMPEST is a niche but high-value requirement that positions operators for long-term government contracts — but demands specialized engineering expertise from the earliest design stages.

---
*Executed: 2026-04-03 | Mode: independent*
