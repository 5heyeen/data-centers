# Prompt 28: power-metering-quality

> **Prompt:** [See prompt chain for full text]

---

# Electrical Metering & Power Quality Monitoring in Data Centers

## Metering Hierarchy

Data center power metering follows a cascading architecture from utility interconnection down to individual server power supplies, with each tier serving distinct operational and commercial purposes.

### Utility Revenue Meter
At the point of common coupling (PCC), the utility installs a **revenue-grade meter** (typically IEC 62053-22 Class 0.5S or ANSI C12.20 Class 0.2) that serves as the billing reference. This meter captures kWh, kVAh, kVARh, and demand (kW) in 15-minute intervals. In colocation facilities, this is the "master meter" against which all downstream sub-metering must reconcile. Revenue meters are sealed and calibrated by the utility or a certified metrological body.

### Main Switchboard (MSB) Meters
At the medium-voltage switchgear (typically 10–36 kV) and downstream low-voltage main distribution boards (LV MDB), multifunction power meters (e.g., Schneider ION9000, ABB M4M, Siemens SENTRON PAC5200) measure per-feeder power, energy, power factor, THD, and demand. These meters typically achieve **Class 0.5S accuracy** and provide 1-second or sub-second data resolution. They enable operators to allocate consumption across mechanical cooling, lighting, and IT loads — the fundamental inputs for **PUE calculation** (Total Facility Power ÷ IT Equipment Power, per ISO 30134-2).

### UPS Input/Output Meters
Uninterruptible power supply systems include integrated metering on both input and output. **UPS input metering** reveals grid power quality and charging load; **UPS output metering** captures the clean power delivered to IT. The delta between input and output quantifies UPS losses (typically 3–8% depending on topology and load level). Modern double-conversion UPS units from Vertiv, Eaton, and Schneider report real-time efficiency, power factor, THD, and battery status via Modbus/TCP or SNMP to the DCIM platform.

### Power Distribution Unit (PDU) Branch Circuit Monitoring
Floor-standing or overhead PDUs (e.g., Schneider Galaxy PDU, Eaton Rack PDU G4) incorporate **branch circuit monitoring (BCM)** that measures current and power per breaker or per whip. This is the tier where capacity planning becomes granular — operators can see which circuits approach 80% of breaker rating (the NEC 210.20 / IEC 60364 continuous load threshold) and where stranded capacity exists. Accuracy is typically ±1% of reading.

### Intelligent Rack PDUs with Per-Outlet Metering
At the rack level, **intelligent rack PDUs** (Raritan PX4, ServerTech PRO2, Schneider NetShelter) provide per-outlet or per-outlet-group metering at ±1% accuracy. This enables:
- **Tenant billing** in colocation (kWh per customer per rack)
- **Server-level power trending** for capacity planning
- **Stranded power identification** at the rack level
- Environmental monitoring (temperature, humidity sensors integrated into the PDU)

Per-outlet data is polled every 1–10 seconds and transmitted via SNMP v3 or RESTful API to DCIM systems.

---

## Power Quality Parameters

### Total Harmonic Distortion (THD)
**IEEE 519-2022** limits voltage THD to **<5% at the PCC** and individual harmonics to <3%. IT loads with switch-mode power supplies historically generated significant current harmonics (3rd, 5th, 7th), but modern **Active Power Factor Correction (Active PFC)** in server PSUs (compliant with IEC 61000-3-2) has substantially reduced current THD. Operators still monitor THD at the MSB and UPS output because elevated harmonics cause transformer overheating (K-factor rated transformers address this), neutral conductor overload in 3-phase systems, and capacitor bank failure.

### Power Factor
Target power factor is **≥0.95 lagging** at the utility meter to avoid reactive power penalties. Modern server PSUs with Active PFC achieve power factors of **0.99 at rated load**. However, lightly loaded UPS systems and older mechanical cooling plants can drag facility-level PF below 0.90. **Automatic power factor correction (APFC) banks** with detuned reactors are deployed at the MSB when needed, though they must be carefully specified to avoid harmonic resonance.

### Voltage Regulation
The **CBEMA/ITIC curve** (ITI Council, revised 2000) defines the voltage envelope that IT equipment must tolerate: **±5% steady-state**, with short-duration transient tolerance up to +/- 10-20% depending on duration. UPS output regulation is typically ±1% in double-conversion mode, well within tolerance. Voltage sags, swells, and transients are logged by power quality analyzers (e.g., Dranetz, Fluke 1770-series) for root cause analysis.

### Transient Voltage Surge Suppression (TVSS)
**Surge protective devices (SPDs)** per IEC 61643 / UL 1449 are installed in a cascading arrangement: Type 1 at the service entrance, Type 2 at distribution boards, and Type 3 at rack PDUs. Monitoring SPD status (degradation of MOV clamping voltage) is increasingly integrated into metering systems.

---

## Metering Data in DCIM and Capacity Planning

All metering tiers feed into the **Data Center Infrastructure Management (DCIM)** platform (e.g., Schneider EcoStruxure IT, Vertiv Trellis, Nlyte, Sunbird dcTrack). Key uses include:

- **PUE calculation**: Real-time and trailing-12-month PUE per ISO 30134-2, using MSB and UPS output meters
- **Capacity planning**: Identifying circuits, PDUs, and panels approaching load thresholds; forecasting time-to-exhaustion
- **Tenant billing**: Aggregating per-outlet or per-circuit kWh data with Class 0.5S accuracy for invoicing (critical in colocation per IEC 62053-22)
- **Anomaly detection**: Sudden load changes, phase imbalance, harmonic excursions triggering automated alerts
- **Carbon reporting**: Multiplying metered kWh by grid emission factors for Scope 2 GHG reporting

The metering hierarchy, from revenue meter down to per-outlet rack PDU, forms the quantitative backbone of data center operations — without it, PUE is guesswork, capacity planning is conservative (and wasteful), and tenant billing lacks defensibility.

---
*Executed: 2026-04-03 | Mode: independent*
