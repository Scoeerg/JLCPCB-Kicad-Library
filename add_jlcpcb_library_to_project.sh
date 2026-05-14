#!/bin/bash
# add_jlcpcb_library_to_project.sh

echo "Adding all JLCPCB libraries to the project..."

# Paths relative to this script location
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
LIB_BASE="${SCRIPT_DIR}/symbols"
TABLE_SYM="${PROJECT_DIR}/sym-lib-table"
TABLE_FP="${PROJECT_DIR}/fp-lib-table"

echo "Project root assumed: $PROJECT_DIR"

# ===================== CREATE TABLES IF MISSING =====================
if [ ! -f "$TABLE_SYM" ]; then
    echo "→ Creating new sym-lib-table"
    touch "$TABLE_SYM"
    cat > "$TABLE_SYM" << EOF
(sym_lib_table
  (version 7)
)
EOF
fi

if [ ! -f "$TABLE_FP" ]; then
    echo "→ Creating new fp-lib-table"
    touch "$TABLE_FP"
    cat > "$TABLE_FP" << EOF
(fp_lib_table
  (version 7)
)
EOF
fi

# ===================== Symbolic Libraries =====================

{
    head -n -1 "$TABLE_SYM" # Old file except last line  (the closing parenthesis)                             
    cat << 'EOF'                                                
  (lib (name "JLCPCB-Analog")(type "KiCad")(uri "${KIPRJMOD}/libs/JLCPCB-Kicad-Library/symbols/JLCPCB-Analog.kicad_sym")(options "")(descr "JLCPCB Analog"))
  (lib (name "JLCPCB-Capacitors")(type "KiCad")(uri "${KIPRJMOD}/libs/JLCPCB-Kicad-Library/symbols/JLCPCB-Capacitors.kicad_sym")(options "")(descr "JLCPCB Capacitors"))
  (lib (name "JLCPCB-Connectors_Buttons")(type "KiCad")(uri "${KIPRJMOD}/libs/JLCPCB-Kicad-Library/symbols/JLCPCB-Connectors_Buttons.kicad_sym")(options "")(descr "JLCPCB Connectors & Buttons"))
  (lib (name "JLCPCB-Crystals")(type "KiCad")(uri "${KIPRJMOD}/libs/JLCPCB-Kicad-Library/symbols/JLCPCB-Crystals.kicad_sym")(options "")(descr "JLCPCB Crystals"))
  (lib (name "JLCPCB-Diode-Packages")(type "KiCad")(uri "${KIPRJMOD}/libs/JLCPCB-Kicad-Library/symbols/JLCPCB-Diode-Packages.kicad_sym")(options "")(descr "JLCPCB Diode Packages"))
  (lib (name "JLCPCB-Diodes")(type "KiCad")(uri "${KIPRJMOD}/libs/JLCPCB-Kicad-Library/symbols/JLCPCB-Diodes.kicad_sym")(options "")(descr "JLCPCB Diodes"))
  (lib (name "JLCPCB-Extended")(type "KiCad")(uri "${KIPRJMOD}/libs/JLCPCB-Kicad-Library/symbols/JLCPCB-Extended.kicad_sym")(options "")(descr "JLCPCB Extended"))
  (lib (name "JLCPCB-ICs")(type "KiCad")(uri "${KIPRJMOD}/libs/JLCPCB-Kicad-Library/symbols/JLCPCB-ICs.kicad_sym")(options "")(descr "JLCPCB ICs"))
  (lib (name "JLCPCB-Inductors")(type "KiCad")(uri "${KIPRJMOD}/libs/JLCPCB-Kicad-Library/symbols/JLCPCB-Inductors.kicad_sym")(options "")(descr "JLCPCB Inductors"))
  (lib (name "JLCPCB-Interface")(type "KiCad")(uri "${KIPRJMOD}/libs/JLCPCB-Kicad-Library/symbols/JLCPCB-Interface.kicad_sym")(options "")(descr "JLCPCB Interface"))
  (lib (name "JLCPCB-Manufacturing")(type "KiCad")(uri "${KIPRJMOD}/libs/JLCPCB-Kicad-Library/symbols/JLCPCB-Manufacturing.kicad_sym")(options "")(descr "JLCPCB Manufacturing"))
  (lib (name "JLCPCB-MCUs")(type "KiCad")(uri "${KIPRJMOD}/libs/JLCPCB-Kicad-Library/symbols/JLCPCB-MCUs.kicad_sym")(options "")(descr "JLCPCB MCUs"))
  (lib (name "JLCPCB-Memory")(type "KiCad")(uri "${KIPRJMOD}/libs/JLCPCB-Kicad-Library/symbols/JLCPCB-Memory.kicad_sym")(options "")(descr "JLCPCB Memory"))
  (lib (name "JLCPCB-Optocouplers")(type "KiCad")(uri "${KIPRJMOD}/libs/JLCPCB-Kicad-Library/symbols/JLCPCB-Optocouplers.kicad_sym")(options "")(descr "JLCPCB Optocouplers"))
  (lib (name "JLCPCB-Power")(type "KiCad")(uri "${KIPRJMOD}/libs/JLCPCB-Kicad-Library/symbols/JLCPCB-Power.kicad_sym")(options "")(descr "JLCPCB Power"))
  (lib (name "JLCPCB-Resistors")(type "KiCad")(uri "${KIPRJMOD}/libs/JLCPCB-Kicad-Library/symbols/JLCPCB-Resistors.kicad_sym")(options "")(descr "JLCPCB Resistors"))
  (lib (name "JLCPCB-Transformers")(type "KiCad")(uri "${KIPRJMOD}/libs/JLCPCB-Kicad-Library/symbols/JLCPCB-Transformers.kicad_sym")(options "")(descr "JLCPCB Transformers"))
  (lib (name "JLCPCB-Transistor-Packages")(type "KiCad")(uri "${KIPRJMOD}/libs/JLCPCB-Kicad-Library/symbols/JLCPCB-Transistor-Packages.kicad_sym")(options "")(descr "JLCPCB Transistor Packages"))
  (lib (name "JLCPCB-Transistors")(type "KiCad")(uri "${KIPRJMOD}/libs/JLCPCB-Kicad-Library/symbols/JLCPCB-Transistors.kicad_sym")(options "")(descr "JLCPCB Transistors"))
  (lib (name "JLCPCB-Variable-Resistors")(type "KiCad")(uri "${KIPRJMOD}/libs/JLCPCB-Kicad-Library/symbols/JLCPCB-Variable-Resistors.kicad_sym")(options "")(descr "JLCPCB Variable Resistors"))
EOF
    tail -n 1 "$TABLE_SYM" # add the last line back (the closing parenthesis)                 
} > "$TABLE_SYM.tmp" && mv "$TABLE_SYM.tmp" "$TABLE_SYM"


#
# ===================== FOOTPRINT LIBRARY =====================

if [ ! -f "$TABLE_FP" ]; then
echo "ERROR: fp-lib-table not found at:"
    echo "$TABLE_FP"
    echo ""
    echo "This script must be run from inside a KiCad project that already has"
    echo "a project-specific fp-lib-table."
    echo ""
    echo "Please open your project in KiCad first (so it generates the table),"
    echo "then run this script again."
    exit 1
fi

{
    head -n -1 "$TABLE_FP" # Old file except last line  (the closing parenthesis)                             
    cat << 'EOF'   
  (lib (name "PCM_JLCPCB")(type "KiCad")(uri "${KIPRJMOD}/libs/JLCPCB-Kicad-Library/symbols/PCM_JLCPCB.kicad_sym")(options "")(descr "JLCPCB PCM Symbols"))(lib (name "PCM_JLCPCB")(type "KiCad")(uri "${KIPRJMOD}/libs/JLCPCB-Kicad-Library/footprints/JLCPCB.pretty")(options "")(descr "JLCPCB Footprints"))
EOF
    tail -n 1 "$TABLE_FP" # add the last line back (the closing parenthesis)                 
} > "$TABLE_FP.tmp" && mv "$TABLE_FP.tmp" "$TABLE_FP"

# ===================== 3D Files =====================
find footprints -name "*.kicad_mod" -exec sed -i 's|${KICAD8_3RD_PARTY}/3dmodels/com_github_CDFER_JLCPCB-Kicad-Library/JLCPCB.3dshapes|${KIPRJMOD}/libs/JLCPCB-Kicad-Library/3dmodels/JLCPCB.3dshapes|g' {} +
#
echo ""
echo "Done!"
echo "Updated $(find footprints -name "*.kicad_mod" | wc -l) footprint files."
echo ""
#
echo "Restart KiCad (fully close and reopen) for the changes to appear."

