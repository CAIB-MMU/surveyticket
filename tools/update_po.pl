#!/usr/bin/perl
#!/usr/bin/perl -w

if (@ARGV!=2){
print "USAGE update_po.pl transifex_login transifex_password\n\n";

exit();
}
$user = $ARGV[0];
$password = $ARGV[1];

opendir(DIRHANDLE,'../locales')||die "ERROR: can not read current directory\n";
foreach (readdir(DIRHANDLE)){
	if ($_ ne '..' && $_ ne '.'){

            if(!(-l "$dir/$_")){
                     if (index($_,".po",0)==length($_)-3) {
                        $lang=$_;
                        $lang=~s/\.po//;

                        `wget --no-check-certificate --user=$user --password=$password --output-document=../locales/$_ https://www.transifex.com/api/2/project/glpi_surveyticket/resource/92xx/translation/$lang/?file=PO`;
                     }
            }

	}
}
closedir DIRHANDLE;

#
#
