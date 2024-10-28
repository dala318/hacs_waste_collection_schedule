#!/bin/bash

verbose=true
if [ "$1" == "-v" ]
then
    verbose=true
fi

checkpath="custom_components/waste_collection_schedule/waste_collection_schedule/source/"

whitelist=(
    "abfall_havelland_de.py"
    "abfall_lippe_de.py"
    "abfall_lro_de.py"
    "abfallkalender_gifhorn_de.py"
    "abfallwirtschaft_fuerth_eu.py"
    "abfallwirtschaft_pforzheim_de.py"
    "abfallwirtschaft_vechta_de.py"
    "abfuhrplan_landkreis_neumarkt_de.py"
    "abki_de.py"
    "act_gov_au.py"
    "adur_worthing_gov_uk.py"
    "affarsverken_se.py"
    "afvalstoffendienst_nl.py"
    "aha_region_de.py"
    "ahe_de.py"
    "alchenstorf_ch.py"
    "allerdale_gov_uk.py"
    "ambervalley_gov_uk.py"
    "antrimandnewtownabbey_gov_uk.py"
    "api_golemio_cz.py"
    "api_hubert_schmid_de.py"
    "app_abfallplus_de.py"
    "app_my_local_services_au.py"
    "apps_imactivate_com.py"
    "ardsandnorthdown_gov_uk.py"
    "armadale_wa_gov_au.py"
    "art_trier_de.py"
    "arun_gov_uk.py"
    "ashfield_gov_uk.py"
    "ashford_gov_uk.py"
    "asr_chemnitz_de.py"
    "awb_bad_kreuznach_de.py"
    "awb_emsland_de.py"
    "awb_mainz_bingen_de.py"
    "awg_de.py"
    "awg_wuppertal_de.py"
    "awigo_de.py"
    "awlneuss_de.py"
    "awm_muenchen_de.py"
    "aylesburyvaledc_gov_uk.py"
    "baden_umweltverbaende_at.py"
    "ballarat_vic_gov_au.py"
    "banyule_vic_gov_au.py"
    "barnsley_gov_uk.py"
    "basildon_gov_uk.py"
    "basingstoke_gov_uk.py"
    "bathnes_gov_uk.py"
    "bcp_gov_uk.py"
    "bedford_gov_uk.py"
    "belmont_wa_gov_au.py"
    "bexley_gov_uk.py"
    "bielefeld_de.py"
    "biffaleicester_co_uk.py"
    "binzone_uk.py"
    "bir_no.py"
    "birmingham_gov_uk.py"
    "blackburn_gov_uk.py"
    "blackpool_gov_uk.py"
    "blacktown_nsw_gov_au.py"
    "bracknell_forest_gov_uk.py"
    "bradford_gov_uk.py"
    "braintree_gov_uk.py"
    "breckland_gov_uk.py"
    "brisbane_qld_gov_au.py"
    "bristol_gov_uk.py"
    "bromley_gov_uk.py"
    "bromsgrove_gov_uk.py"
    "broxbourne_gov_uk.py"
    "broxtowe_gov_uk.py"
    "buergerportal_de.py"
    "burnley_gov_uk.py"
    "bury_gov_uk.py"
    "calgary_ca.py"
    "cambridge_gov_uk.py"
    "camden_gov_uk.py"
    "campbelltown_nsw_gov_au.py"
    "canadabay_nsw_gov_au.py"
    "canterbury_gov_uk.py"
    "cardiff_gov_uk.py"
    "cardinia_vic_gov_au.py"
    "carmarthenshire_gov_wales.py"
    "ceb_coburg_de.py"
    "cederbaum_de.py"
    "centralbedfordshire_gov_uk.py"
    "charnwood_gov_uk.py"
    "chelmsford_gov_uk.py"
    "cherwell_gov_uk.py"
    "cheshire_east_gov_uk.py"
    "cheshire_west_and_chester_gov_uk.py"
    "chesterfield_gov_uk.py"
    "chichester_gov_uk.py"
    "chiemgau_recycling_lk_rosenheim.py"
    "cidiu_it.py"
    "circulus_nl.py"
    "citiesapps_com.py"
    "cockburn_wa_gov_au.py"
    "colchester_gov_uk.py"
    "conwy_gov_uk.py"
    "cornwall_gov_uk.py"
    "crawley_gov_uk.py"
    "croydon_gov_uk.py"
    "cumberland_nsw_gov_au.py"
    "darebin_vic_gov_au.py"
    "darlington_gov_uk.py"
    "denbighshire_gov_uk.py"
    "derby_gov_uk.py"
    "dillingen_saar_de.py"
    "doncaster_gov_uk.py"
    "dorset_gov_uk.py"
    "dover_gov_uk.py"
    "dudley_gov_uk.py"
    "dundeecity_gov_uk.py"
    "dunedin_govt_nz.py"
    "durham_gov_uk.py"
    "ead_darmstadt_de.py"
    "east_ayrshire_gov_uk.py"
    "east_northamptonshire_gov_uk.py"
    "east_renfrewshire_gov_uk.py"
    "eastcambs_gov_uk.py"
    "eastdevon_gov_uk.py"
    "eastherts_gov_uk.py"
    "eastleigh_gov_uk.py"
    "eastlothian_gov_uk.py"
    "eastriding_gov_uk.py"
    "edlitz_at.py"
    "edpevent_se.py"
    "egn_abfallkalender_de.py"
    "eigenbetrieb_abfallwirtschaft_de.py"
    "eko_tom_pl.py"
    "ekosystem_wroc_pl.py"
    "elmbridge_gov_uk.py"
    "environmentfirst_co_uk.py"
    "esch_lu.py"
    "eth_erd_hu.py"
    "exeter_gov_uk.py"
    "fareham_gov_uk.py"
    "fccenvironment_co_uk.py"
    "fenland_gov_uk.py"
    "fife_gov_uk.py"
    "fkf_bo_hu.py"
    "fkf_bp_hu.py"
    "flintshire_gov_uk.py"
    "folkestone_hythe_gov_uk.py"
    "fosenrenovasjon_no.py"
    "frankenberg_de.py"
    "frankston_vic_gov_au.py"
    "fylde_gov_uk.py"
    "gastrikeatervinnare_se.py"
    "gateshead_gov_uk.py"
    "geelongaustralia_com_au.py"
    "gfa_lueneburg_de.py"
    "glasgow_gov_uk.py"
    "gmina_miekinia_pl.py"
    "goldcoast_qld_gov_au.py"
    "gotland_se.py"
    "grafikai_svara_lt.py"
    "grosswangen_ch.py"
    "guildford_gov_uk.py"
    "gwynedd_gov_uk.py"
    "haringey_gov_uk.py"
    "harlow_gov_uk.py"
    "harrow_gov_uk.py"
    "hart_gov_uk.py"
    "hausmuell_info.py"
    "hawkesbury_nsw_gov_au.py"
    "hcc_govt_nz.py"
    "heilbronn_de.py"
    "herefordshire_gov_uk.py"
    "highland_gov_uk.py"
    "highpeak_gov_uk.py"
    "hobsonsbay_vic_gov_au.py"
    "hornsby_nsw_gov_au.py"
    "horowhenua_govt_nz.py"
    "horsham_gov_uk.py"
    "hounslow_gov_uk.py"
    "hull_gov_uk.py"
    "hume_vic_gov_au.py"
    "huntingdonshire_gov_uk.py"
    "hvcgroep_nl.py"
    "hygea_be.py"
    "iapp_itouchvision_com.py"
    "ilrifiutologo_it.py"
    "impactapps_com_au.py"
    "innerwest_nsw_gov_au.py"
    "insert_it_de.py"
    "ipswich_qld_gov_au.py"
    "irenambiente_it.py"
    "iris_salten_no.py"
    "islington_gov_uk.py"
    "isontinambiente_it.py"
    "iweb_itouchvision_com.py"
    "jointwastesolutions_org.py"
    "jumomind_de.py"
    "juneavfall_se.py"
    "karlsruhe_de.py"
    "kiertokapula_fi.py"
    "kingston_gov_uk.py"
    "kingston_vic_gov_au.py"
    "kirklees_gov_uk.py"
    "knox_vic_gov_au.py"
    "koeniz_ch.py"
    "ks_boerde_de.py"
    "kuringgai_nsw_gov_au.py"
    "kwb_goslar_de.py"
    "kwu_de.py"
    "lakemac_nsw_gov_au.py"
    "lancaster_gov_uk.py"
    "landkreis_kusel_de.py"
    "landkreis_rhoen_grabfeld.py"
    "lbbd_gov_uk.py"
    "lerum_se.py"
    "lewisham_gov_uk.py"
    "lichfielddc_gov_uk.py"
    "lincoln_gov_uk.py"
    "lindau_ch.py"
    "lisburn_castlereagh_gov_uk.py"
    "liverpool_gov_uk.py"
    "lobbe_app.py"
    "logan_qld_gov_au.py"
    "lsr_nu.py"
    "lumire_se.py"
    "lund_se.py"
    "mags_de.py"
    "maidstone_gov_uk.py"
    "maldon_gov_uk.py"
    "mamirolle_info.py"
    "manchester_uk.py"
    "mansfield_gov_uk.py"
    "mansfield_vic_gov_au.py"
    "maribyrnong_vic_gov_au.py"
    "maroondah_vic_gov_au.py"
    "meinawb_de.py"
    "melton_vic_gov_au.py"
    "merri_bek_vic_gov_au.py"
    "merton_gov_uk.py"
    "mestorudna_cz.py"
    "midsussex_gov_uk.py"
    "miljoteknik_se.py"
    "milton_keynes_gov_uk.py"
    "minrenovasjon_no.py"
    "moje_odpady_pl.py"
    "mojiodpadki_si.py"
    "molndal_se.py"
    "monaloga_de.py"
    "montreal_ca.py"
    "moray_gov_uk.py"
    "mosman_nsw_gov_au.py"
    "movar_no.py"
    "mpgk_com_pl.py"
    "mrsc_vic_gov_au.py"
    "muellabfuhr_de.py"
    "muenchenstein_ch.py"
    "myutility_winnipeg_ca.py"
    "napier_govt_nz.py"
    "nawma_sa_gov_au.py"
    "newark_sherwooddc_gov_uk.py"
    "newcastle_gov_uk.py"
    "newcastle_staffs_gov_uk.py"
    "newham_gov_uk.py"
    "zakb_de.py"
    "nillumbik_vic_gov_au.py"
    "north_ayrshire_gov_uk.py"
    "north_kesteven_org_uk.py"
    "northherts_gov_uk.py"
    "northlincs_gov_uk.py"
    "northnorthants_gov_uk.py"
    "northyorks_hambleton_gov_uk.py"
    "northyorks_harrogate_gov_uk.py"
    "northyorks_scarborough_gov_uk.py"
    "northyorks_selby_gov_uk.py"
    "nottingham_city_gov_uk.py"
    "nsomerset_gov_uk.py"
    "nuernberger_land_de.py"
    "nvaa_se.py"
    "nwleics_gov_uk.py"
    "nyc_gov.py"
    "oadby_wigston_gov_uk.py"
    "odenserenovation_dk.py"
    "okc_gov.py"
    "onkaparingacity_com.py"
    "orillia_ca.py"
    "oslokommune_no.py"
    "oxford_gov_uk.py"
    "pembrokeshire_gov_uk.py"
    "peterborough_gov_uk.py"
    "pgh_st.py"
    "poriruacity_govt_nz.py"
    "portenf_sa_gov_au.py"
    "portsmouth_gov_uk.py"
    "portstephens_nsw_gov_au.py"
    "potsdam_de.py"
    "poznan_pl.py"
    "pronatura_bydgoszcz_pl.py"
    "rambo_se.py"
    "rapperswil_be_ch.py"
    "rbwm_gov_uk.py"
    "rctcbc_gov_uk.py"
    "rd4_nl.py"
    "reading_gov_uk.py"
    "real_luzern_ch.py"
    "recyclecoach_com.py"
    "redbridge_gov_uk.py"
    "redland_qld_gov_au.py"
    "reigatebanstead_gov_uk.py"
    "remidt_no.py"
    "renfrewshire_gov_uk.py"
    "renhallningen_kristianstad_se.py"
    "renodjurs_dk.py"
    "renosyd_dk.py"
    "republicservices_com.py"
    "reso_gmbh_de.py"
    "richmondshire_gov_uk.py"
    "rochdale_gov_uk.py"
    "rotherham_gov_uk.py"
    "rotorua_lakes_council_nz.py"
    "roundlookup_uk.py"
    "roundrocktexas_gov.py"
    "runnymede_gov_uk.py"
    "rushcliffe_gov_uk.py"
    "rushmoor_gov_uk.py"
    "rv_de.py"
    "ryde_nsw_gov_au.py"
    "salford_gov_uk.py"
    "samiljo_se.py"
    "sammelkalender_ch.py"
    "sandnes_no.py"
    "sbazv_de.py"
    "scambs_gov_uk.py"
    "scheibbs_umweltverbaende_at.py"
    "seattle_gov.py"
    "sepan_remondis_pl.py"
    "sheffield_gov_uk.py"
    "shellharbourwaste_com_au.py"
    "sholland_gov_uk.py"
    "shropshire_gov_uk.py"
    "sica_lu.py"
    "sivom_rivedroite_fr.py"
    "snaga_mb_si.py"
    "solihull_gov_uk.py"
    "south_norfolk_and_broadland_gov_uk.py"
    "southampton_gov_uk.py"
    "southderbyshire_gov_uk.py"
    "southglos_gov_uk.py"
    "southkesteven_gov_uk.py"
    "southtyneside_gov_uk.py"
    "staedteservice_de.py"
    "staffordbc_gov_uk.py"
    "stalbans_gov_uk.py"
    "stavanger_no.py"
    "stevenage_gov_uk.py"
    "stirling_uk.py"
    "stirling_wa_gov_au.py"
    "stockport_gov_uk.py"
    "stockton_gov_uk.py"
    "stoke_gov_uk.py"
    "stonnington_vic_gov_au.py"
    "stratford_gov_uk.py"
    "stroud_gov_uk.py"
    "sutton_gov_uk.py"
    "swansea_gov_uk.py"
    "swindon_gov_uk.py"
    "sysav_se.py"
    "tameside_gov_uk.py"
    "tauranga_govt_nz.py"
    "tbv_velbert_de.py"
    "tekniskaverken_se.py"
    "telford_gov_uk.py"
    "tewkesbury_gov_uk.py"
    "tkeliai_lt.py"
    "tmbc_gov_uk.py"
    "tonnenleerung_de.py"
    "toogoodtowaste_co_nz.py"
    "toronto_ca.py"
    "townsville_qld_gov_au.py"
    "tunbridgewells_gov_uk.py"
    "umweltverbaende_at.py"
    "unley_sa_gov_au.py"
    "uttlesford_gov_uk.py"
    "valeofglamorgan_gov_uk.py"
    "vasyd_se.py"
    "vestfor_dk.py"
    "victoriapark_wa_gov_au.py"
    "vivab_se.py"
    "vmeab_se.py"
    "walsall_gov_uk.py"
    "wanneroo_wa_gov_au.py"
    "warrington_gov_uk.py"
    "warwickdc_gov_uk.py"
    "was_wolfsburg_de.py"
    "wastecollection_mt.py"
    "wastenet_org_nz.py"
    "waverley_gov_uk.py"
    "wealden_gov_uk.py"
    "welhat_gov_uk.py"
    "wellington_govt_nz.py"
    "wermelskirchen_de.py"
    "west_dunbartonshire_gov_uk.py"
    "west_norfolk_gov_uk.py"
    "westberks_gov_uk.py"
    "westnorthants_gov_uk.py"
    "westoxon_gov_uk.py"
    "westsuffolk_gov_uk.py"
    "whitehorse_vic_gov_au.py"
    "whittlesea_vic_gov_au.py"
    "wigan_gov_uk.py"
    "wiltshire_gov_uk.py"
    "winterthur_ch.py"
    "wirral_gov_uk.py"
    "wokingham_gov_uk.py"
    "wollondilly_nsw_gov_au.py"
    "wollongongwaste_com_au.py"
    "wychavon_gov_uk.py"
    "wyndham_vic_gov_au.py"
    "wyre_gov_uk.py"
    "wyreforestdc_gov_uk.py"
    "yarra_ranges_vic_gov_au.py"
    "york_gov_uk.py"
)

# Build a git-exclude and git-include strings
grep_exclude=""
grep_include=""
for excluded in "${whitelist[@]}"
do
    grep_exclude="${grep_exclude} \":(exclude)*${excluded}\""
    grep_include="${grep_include} ${checkpath}${excluded}"
done

# Initiate pass-state
failed=false

# Grep for icon definitions in source folder but excude whitelisted
git grep -q mdi: -- "$checkpath" $grep_exclude
if [ $? -eq "0" ]; then
    # Exit code == 0 -> match found -> make exit 1
    echo "Found icon definitions direcly in source folder!"
    failed=true
    if [ $verbose = "true" ]
    then
        echo "The following files are not complying:"
        echo $(git grep --name mdi: -- "$checkpath" $grep_exclude)
    fi
    echo ""
fi

# Grep for non-icon definitions in whitelisted
git grep -L -q mdi: -- $grep_include
if [ $? -eq "0" ]; then
    # Exit code == 0 -> match found -> make exit 1
    echo "One or more of the whitelisted sources have no icon definitions, remove from whitelist!"
    failed=true
    if [ $verbose = "true" ]
    then
        echo "The following files are not complying:"
        echo $(git grep -L mdi: -- $grep_include)
    fi
    echo ""
fi

# Make exit
if [ "$failed" = "true" ];
then
    if [ $verbose = "false" ]
    then
        echo "Run \"./script/check_icon_use.sh -v\" to get a list of files that don't comply"
    fi
    exit 1
fi
exit 0
