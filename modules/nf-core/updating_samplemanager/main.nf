process UPDATING_SAMPLEMANAGER {
    label 'process_single'
    //SECRET TOKEN
    memory '1 G'
    errorStrategy { task.exitStatus == 143 ? 'retry' : 'ignore' }

    input:
    path "*multiqc_report.html"       
    
    
    output:
    path "workflow_complete.txt"

   //when:
    //task.ext.when == null || task.ext.when

    script:
    """
    touch workflow_complete.txt
    echo "workflow complete" >> workflow_complete.txt
    """
}