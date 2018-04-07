#!/bin/bash
input=""
output=""
quality="75"
resolution="50"
text=""
prefix=""
suffix=""
boolCompressQuality="0"
boolCompressResolution="0"
boolTextWatermark="0"
boolPrefix="0"
boolSuffix="0"
boolTransFormat="0"
watermark_name="watermark"

function Usage

{
    echo "Usage:"
    echo "  -i  --input <filename>              Input image for processing"
    echo "  -o  --output <filename>             Saving image"
    echo "  -q, --quality <percent>             Image quality compression, default 75%, input and output are needed"
    echo "  -r, --resolution <percent>          Image resolution compression, default 50%, input and output are needed"
    echo "  -w, --watermark <text>              Add text watermark, input and output are needed"
    echo "  -p, --prefix <prefix>               Add prefix"
    echo "  -s, --suffix <suffix>               Add suffix"
    echo "  -t, --transfer                      Transfer image format, input and output are needed"
    echo "  -h,  --help                         Get the usage help"
}

function compressQuality
{
    if [ -f "$1" ]; then  
        $(convert -quality "$quality"% "$input" "$output")
        echo " Compress "$input" into "$output"."   
    else  
        echo "No such a file  exist."  
    fi
}

function compressResolution
{
    if [ -f "$1" ]; then 
        $(convert -resize "$resolution"% "$input" "$output")
        echo " Compress "$input" into "$output"."  
    else
        echo "No such a file exist."
    fi
}

function addTextWatermark
{	  
	for name in `ls *.jpg`
    do
		cp "$name" "$watermark_name"."$name"
		$(convert "$name" -draw "gravity east fill black  text 0,12 "$1"" "$watermark_name"."$name") 
		echo ""$watermark_name"."$name" contains the text:"$1""
        
    done
}

function transFormat
{
    if [ -f "$1" ]; then 
        $(convert "$1" "$2")
        echo "Transfer "$1" into "$2""
    else
        echo "No such a file exist."
    fi
}

function addPrefix
{
    for name in `ls *.jpg`
    do
        cp "$name" "$1"."$name"
    done
}

function addSuffix
{
    for name in `ls *.jpg`
        do
        cp "$name" "$name"."$1"
        done
}

while [ $# -gt 0 ]; do
	case "$1" in
		-i|--input)	echo "input:\`$2'" ;
			case "$2" in
				"") echo "no parameter" ; break ;;
				*)  input=$2; shift 2 ;;
			esac ;;
                     
		-o|--output)	echo "output:\`$2'" ;
			case "$2" in
				"") echo "no parameter" ; break ;;
				*)  output=$2; shift 2 ;;
			esac ;;

        -q|--quality)	echo "compressQuality" ;
			if [ ! -n "$2" ] ;then
				quality="50"; boolCompressQuality="1" ; shift 1 ;
			else
				quality=$2 ; boolCompressQuality="1" ; shift 2 ;
			fi;;   
        -r|--resolution)      echo "resolution" ;
			if [ ! -n "$2" ] ;then
				resolution="50"; boolCompressResolution="1" ; shift 1 ;
			else
				resolution=$2 ; boolCompressResolution="1" ; shift 2 ;
			fi;;    
                              

        -w|--watermark)   echo "watermark,text: \`$2'" ;
			      text=$2 ; boolTextWatermark="1"	 ; shift 2 ;;		  
			     
   		  	       
		-p|--prefix)	      echo "addPrefix: \`$2' " ;
			      case "$2" in
					"") echo "parameter is needed" ; break ;;
			          *)  boolPrefix="1" ; prefix=$2 ; shift 2 ;;	  
			      esac ;;	
		
			
		-s|--suffix)	      echo "addSuffix: \`$2' " ;
			      case "$2" in
				  "") echo "parameter is needed" ; break ;;
				  *)  boolSuffix="1" ; suffix=$2 ; shift 2 ;;  
			      esac ;;
			      
		-t|--transfer) 	      echo "Option transfer" ;
                              boolTransFormat="1"
                              shift ;;

        -h|--help)	      Usage
                       	      exit
                       	      ;;

		\?)                   Usage
                              exit 1 ;;

		esac
   
done



if [ "$boolCompressQuality" == "1" ] ; then
	compressQuality $input $quality $output
fi

if [ "$boolCompressResolution" == "1" ] ; then
        compressResolution $input $resolution $output
fi

if [ "$boolTransFormat" == "1" ] ; then
        transFormat $input $output
fi

if [ "$boolTextWatermark" == "1" ] ; then
        addTextWatermark $text
fi

if [ "$boolPrefix" == "1"  ] ; then
        addPrefix $prefix
fi

if [ "$boolSuffix" == "1" ] ; then
        addSuffix $suffix
fi
