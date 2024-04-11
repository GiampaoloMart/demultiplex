process UPDATING_SAMPLEMANAGER {
    label 'process_single'
    //SECRET TOKEN
    memory '1 G'
    errorStrategy { task.exitStatus == 143 ? 'retry' : 'ignore' }

    input:
    path "*multiqc_report.html"
    path "*_data"              
    path "*_plots"             
    path "versions.yml"        
    
    
    output:
    path "workflow_complete.txt"

   //when:
    //task.ext.when == null || task.ext.when

    script:
    """
    # curl  -s -H "Authorization: Bearer $SMTOKEN"  -X PUT  "$SMURL/public/batch/1542/Status/waiting%20for%20run%20validation/"   |jq

    touch workflow_complete.txt
    echo "workflow complete" >> workflow_complete.txt
    """
}