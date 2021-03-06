#
# Authentic Theme 10.0.0 (https://github.com/qooob/authentic-theme)
# Copyright 2015 Ilia Rostovtsev <programming@rostovtsev.ru>
# Licensed under MIT (https://github.com/qooob/authentic-theme/blob/master/LICENSE)
#

# Load dependencies
do "authentic-theme/authentic-lib.cgi";

sub theme_header {
    print '<!DOCTYPE html>',        "\n";
    print '<html>',                 "\n";
    print '<head>',                 "\n";
    print '<title>',                $_[0], '</title>', "\n";
    print '<meta charset="utf-8">', "\n";
    print '<link rel="shortcut icon" href="'
        . $gconfig{'webprefix'}
        . '/images/favicon'
        . (
        ( &get_product_name() eq 'usermin' )
        ? '-usermin'
        : '-webmin'
        ) . '.ico">' . "\n";
    print
        '<meta name="viewport" content="width=device-width, initial-scale=1.0">'
        . "\n";
    print '<link href="'
        . $gconfig{'webprefix'}
        . '/unauthenticated/css/bootstrap.min.css?v1000" rel="stylesheet" type="text/css">'
        . "\n";
    print '<link href="'
        . $gconfig{'webprefix'}
        . '/unauthenticated/css/fontawesome.min.css?v1000" rel="stylesheet" type="text/css">'
        . "\n";
    print '<link href="'
        . $gconfig{'webprefix'}
        . '/unauthenticated/css/codemirror.min.css?v1000" rel="stylesheet" type="text/css">'
        . "\n";
    print '<link href="'
        . $gconfig{'webprefix'}
        . '/unauthenticated/css/jquery.scrollbar.min.css?v1000" rel="stylesheet" type="text/css">'
        . "\n";
    print '<link href="'
        . $gconfig{'webprefix'}
        . '/unauthenticated/css/jquery.datatables.min.css?v1000" rel="stylesheet" type="text/css">'
        . "\n";
    print '<link href="'
        . $gconfig{'webprefix'}
        . '/unauthenticated/css/jquery.autocomplete.min.css?v1000" rel="stylesheet" type="text/css">'
        . "\n";
    print '<link href="'
        . $gconfig{'webprefix'}
        . '/unauthenticated/css/select2.min.css?v1000" rel="stylesheet" type="text/css">'
        . "\n";
    print '<link href="'
        . $gconfig{'webprefix'}
        . '/unauthenticated/css/default.min.css?v1000" rel="stylesheet" type="text/css">'
        . "\n";
    embed_styles();
    embed_settings();

    if (   &foreign_available("virtual-server")
        || &foreign_available("server-manager") )
    {

        if ( -d $root_directory . "/virtual-server/timeplot" ) {
            print
                '<script src="/unauthenticated/js/timeplot/virtual-server/timeplot.min.js?local" type="text/javascript"></script>'
                . "\n";
        }
        elsif ( -d $root_directory . "/server-manager/timeplot" ) {
            print
                '<script src="/unauthenticated/js/timeplot/server-manager/timeplot.min.js?local" type="text/javascript"></script>'
                . "\n";
        }
    }

    print '<script src="'
        . $gconfig{'webprefix'}
        . '/unauthenticated/js/spin.min.js?v1000" type="text/javascript"></script>'
        . "\n";

    print '<script src="'
        . $gconfig{'webprefix'}
        . '/unauthenticated/js/jquery.min.js?v1000" type="text/javascript"></script>'
        . "\n";
    print '<script src="'
        . $gconfig{'webprefix'}
        . '/unauthenticated/js/jquery.scrollbar.min.js?v1000" type="text/javascript"></script>'
        . "\n";
    print '<script src="'
        . $gconfig{'webprefix'}
        . '/unauthenticated/js/jquery.autocomplete.min.js?v1000" type="text/javascript"></script>'
        . "\n";
    print '<script src="'
        . $gconfig{'webprefix'}
        . '/unauthenticated/js/select2.min.js?v1000" type="text/javascript"></script>'
        . "\n";
    print '<script src="'
        . $gconfig{'webprefix'}
        . '/unauthenticated/js/jquery.purl.min.js?v1000" type="text/javascript"></script>'
        . "\n";
    print '<script src="'
        . $gconfig{'webprefix'}
        . '/unauthenticated/js/slimscroll.min.js?v1000" type="text/javascript"></script>'
        . "\n";
    print '<script src="'
        . $gconfig{'webprefix'}
        . '/unauthenticated/js/bootstrap.min.js?v1000" type="text/javascript"></script>'
        . "\n";
    print '<script src="'
        . $gconfig{'webprefix'}
        . '/unauthenticated/js/fileinput.min.js?v1000" type="text/javascript"></script>'
        . "\n";
    print '<script src="'
        . $gconfig{'webprefix'}
        . '/unauthenticated/js/codemirror.min.js?v1000" type="text/javascript"></script>'
        . "\n";
    print '<script src="'
        . $gconfig{'webprefix'}
        . '/unauthenticated/js/jquery.datatables.min.js?v1000" type="text/javascript"></script>'
        . "\n";
    print '<script src="'
        . $gconfig{'webprefix'}
        . '/unauthenticated/js/jquery.datatables.plugins.min.js?v1000" type="text/javascript"></script>'
        . "\n";
    print '<script src="'
        . $gconfig{'webprefix'}
        . '/unauthenticated/js/tinymce/tinymce.min.js?v1000" type="text/javascript"></script>'
        . "\n";
    print '<script src="'
        . $gconfig{'webprefix'}
        . '/unauthenticated/js/loader.min.js?v1000" type="text/javascript"></script>'
        . "\n";
    print '<script src="'
        . $gconfig{'webprefix'}
        . '/unauthenticated/js/transition.min.js?v1000" type="text/javascript"></script>'
        . "\n";
    print '<script src="'
        . $gconfig{'webprefix'}
        . '/unauthenticated/js/incompatibility.min.js?v1000" type="text/javascript"></script>'
        . "\n";

    print '</head>', "\n";
    print '<body data-webprefix="'
        . $gconfig{'webprefix'}
        . '" data-current-product="'
        . &get_product_name() . '">' . "\n";

    if ( @_ > 1 ) {
        print '<div class="container-fluid col-lg-10 col-lg-offset-1">'
            . "\n";
        my %this_module_info = &get_module_info( &get_module_name() );
        print '<div class="panel panel-default">' . "\n";
        print '<div class="panel-heading">' . "\n";
        print "<table class='header' width=100%><tr>\n";
        if ( $gconfig{'sysinfo'} == 2 && $remote_user ) {
            print "<td id='headln1' colspan=3 align=center>\n";
            print &get_html_status_line(1);
            print "</td></tr> <tr>\n";
        }
        print "<td id='headln2l' width=15% align=left>";
        if ( $ENV{'HTTP_WEBMIN_SERVERS'} && !$tconfig{'framed'} ) {
            print "<a href='$ENV{'HTTP_WEBMIN_SERVERS'}'>",
                "$text{'header_servers'}</a><br>\n";
        }
        if ( !$_[5] && !$tconfig{'noindex'} ) {
            my @avail = &get_available_module_infos(1);
            my $nolo
                = $ENV{'ANONYMOUS_USER'}
                || $ENV{'SSL_USER'}
                || $ENV{'LOCAL_USER'}
                || $ENV{'HTTP_USER_AGENT'} =~ /webmin/i;
            if (   $gconfig{'gotoone'}
                && $main::session_id
                && @avail == 1
                && !$nolo )
            {
                print
                    "<a href='$gconfig{'webprefix'}/session_login.cgi?logout=1'>",
                    "$text{'main_logout'}</a><br>";
            }
            elsif ( $gconfig{'gotoone'} && @avail == 1 && !$nolo ) {
                print "<a href=$gconfig{'webprefix'}/switch_user.cgi>",
                    "$text{'main_switch'}</a><br>";
            }
            elsif ( !$gconfig{'gotoone'} || @avail > 1 ) {
                print "<a href='$gconfig{'webprefix'}/?cat=",
                    $this_module_info{'category'},
                    "'>$text{'header_webmin'}</a><br>\n";
            }
        }
        if ( !$_[4] && !$tconfig{'nomoduleindex'} ) {
            my $idx = $this_module_info{'index_link'};
            my $mi = $module_index_link || "/" . &get_module_name() . "/$idx";
            my $mt = $module_index_name || $text{'header_module'};
            print "<a href=\"$gconfig{'webprefix'}$mi\">$mt</a><br>\n";
        }
        if (   ref( $_[2] ) eq "ARRAY"
            && !$ENV{'ANONYMOUS_USER'}
            && !$tconfig{'nohelp'} )
        {
            print &hlink( $text{'header_help'}, $_[2]->[0], $_[2]->[1] ),
                "<br>\n";
        }
        elsif (defined( $_[2] )
            && !$ENV{'ANONYMOUS_USER'}
            && !$tconfig{'nohelp'} )
        {
            print &hlink( $text{'header_help'}, $_[2] ), "<br>\n";
        }
        if ( $_[3] ) {
            my %access = &get_module_acl();
            if ( !$access{'noconfig'} && !$config{'noprefs'} ) {
                my $cprog
                    = $user_module_config_directory
                    ? "uconfig.cgi"
                    : "config.cgi";
                print "<a href=\"$gconfig{'webprefix'}/$cprog?",
                    &get_module_name() . "\">",
                    $text{'header_config'}, "</a><br>\n";
            }
        }
        print "</td>\n";
        if ( $_[1] ) {
            print "<td id='headln2c' align=center width=70%>",
                "<img alt=\"$_[0]\" src=\"$_[1]\"></td>\n";
        }
        else {
            my $ts
                = defined( $tconfig{'titlesize'} )
                ? $tconfig{'titlesize'}
                : "+2";
            print "<td id='headln2c' align=center width=70%>",
                ( $ts ? "<font size=$ts>" : "" ), $_[0],
                ( $ts ? "</font>" : "" );
            print "<br>$_[9]\n" if ( $_[9] );
            print "</td>\n";
        }
        print "<td id='headln2r' width=15% align=right>";
        print $_[6];
        print "</td></tr></table>\n";
        print $tconfig{'postheader'};
        print '</div>' . "\n";
        print '<div class="panel-body">' . "\n";
    }
    $miniserv::page_capture = 1;
}

sub theme_popup_prehead {
    if ( index( $ENV{'REQUEST_URI'}, 'help.cgi' ) != 1 ) {
        print '<meta charset="utf-8">', "\n";
        print '<link rel="shortcut icon" href="'
            . $gconfig{'webprefix'}
            . '/images/favicon'
            . (
            ( &get_product_name() eq 'usermin' )
            ? '-usermin'
            : '-webmin'
            ) . '.ico">' . "\n";
        print
            '<meta name="viewport" content="width=device-width, initial-scale=1.0">'
            . "\n";
        print '<link href="'
            . $gconfig{'webprefix'}
            . '/unauthenticated/css/bootstrap.min.css?v1000" rel="stylesheet" type="text/css">',
            "\n";
        print '<link href="'
            . $gconfig{'webprefix'}
            . '/unauthenticated/css/default.min.css?v1000" rel="stylesheet" type="text/css">',
            "\n";
        print '<script src="'
            . $gconfig{'webprefix'}
            . '/unauthenticated/js/jquery.min.js?v1000" type="text/javascript"></script>',
            "\n";
        print '<script src="'
            . $gconfig{'webprefix'}
            . '/unauthenticated/js/cgi.min.js?v1000" type="text/javascript"></script>',
            "\n";
        print '<script src="'
            . $gconfig{'webprefix'}
            . '/unauthenticated/js/filtermatch.min.js?v1000" type="text/javascript"></script>',
            "\n";
    }
}

sub theme_footer {
    for ( my $i = 0; $i + 1 < @_; $i += 2 ) {
        my $url = $_[$i];
        if ( $url ne '/' || !$tconfig{'noindex'} ) {
            if ( $url eq '/' ) {
                $url = "/?cat=$this_module_info{'category'}";
            }
            elsif ( $url eq '' && &get_module_name() ) {
                $url
                    = "/"
                    . &get_module_name() . "/"
                    . $this_module_info{'index_link'};
            }
            elsif ( $url =~ /^\?/ && &get_module_name() ) {
                $url = "/" . &get_module_name() . "/$url";
            }
            $url = "$gconfig{'webprefix'}$url" if ( $url =~ /^\// );
            print
                "&nbsp;<a style='margin-bottom: 15px;' class='btn btn-primary' href=\"$url\"><i class='fa fa-arrow-left'></i> ",
                &text( 'main_return', $_[ $i + 1 ] ), "</a>\n";
        }
    }

    print "</div>\n";

    if ( $ENV{'SCRIPT_NAME'} ne '/session_login.cgi' ) {
        print '<script src="'
            . $gconfig{'webprefix'}
            . '/unauthenticated/js/default.min.js?v1000" type="text/javascript"></script>'
            . "\n";
    }
    embed_scripts();
    print '</body>', "\n";
    print '</html>', "\n";
}

sub theme_file_chooser_button {
    my $form   = defined( $_[2] ) ? $_[2] : 0;
    my $chroot = defined( $_[3] ) ? $_[3] : "/";
    my $add    = int( $_[4] );
    my ( $w, $h ) = ( 520, 600 );
    if ( $gconfig{'db_sizefile'} ) {
        ( $w, $h ) = split( /x/, $gconfig{'db_sizefile'} );
    }
    return
        "<button class='btn btn-default file_chooser_button' style='height: 34px; vertical-align:middle !important;' type=button onClick='ifield = form.$_[0]; chooser = window.open(\"$gconfig{'webprefix'}/chooser.cgi?add=$add&type=$_[1]&chroot=$chroot&file=\"+encodeURIComponent(ifield.value), \"chooser\", \"toolbar=no,menubar=no,scrollbars=no,resizable=yes,width=$w,height=$h\"); chooser.ifield = ifield; window.ifield = ifield'>...</button>\n";
}

sub theme_user_chooser_button {
    my $form = defined( $_[2] ) ? $_[2] : 0;
    my $w    = $_[1]            ? 500   : 300;
    my $h    = 600;
    if ( $_[1] && $gconfig{'db_sizeusers'} ) {
        ( $w, $h ) = split( /x/, $gconfig{'db_sizeusers'} );
    }
    elsif ( !$_[1] && $gconfig{'db_sizeuser'} ) {
        ( $w, $h ) = split( /x/, $gconfig{'db_sizeuser'} );
    }
    return
        "<input type=button onClick='ifield = form.$_[0]; chooser = window.open(\"$gconfig{'webprefix'}/user_chooser.cgi?multi=$_[1]&user=\"+encodeURIComponent(ifield.value), \"chooser\", \"toolbar=no,menubar=no,scrollbars=no,resizable=yes,width=$w,height=$h\"); chooser.ifield = ifield; window.ifield = ifield' value=\"...\">\n";
}

sub theme_group_chooser_button {
    my $form = defined( $_[2] ) ? $_[2] : 0;
    my $w    = $_[1]            ? 500   : 300;
    my $h    = 600;
    if ( $_[1] && $gconfig{'db_sizeusers'} ) {
        ( $w, $h ) = split( /x/, $gconfig{'db_sizeusers'} );
    }
    elsif ( !$_[1] && $gconfig{'db_sizeuser'} ) {
        ( $w, $h ) = split( /x/, $gconfig{'db_sizeuser'} );
    }
    return
        "<input type=button onClick='ifield = form.$_[0]; chooser = window.open(\"$gconfig{'webprefix'}/group_chooser.cgi?multi=$_[1]&group=\"+encodeURIComponent(ifield.value), \"chooser\", \"toolbar=no,menubar=no,scrollbars=no,resizable=yes,width=$w,height=$h\"); chooser.ifield = ifield; window.ifield = ifield' value=\"...\">\n";
}

sub theme_date_chooser_button {
    my ( $w, $h ) = ( 320, 270 );
    if ( $gconfig{'db_sizedate'} ) {
        ( $w, $h ) = split( /x/, $gconfig{'db_sizedate'} );
    }
    return
        "<input type=button onClick='window.dfield = form.$_[0]; window.mfield = form.$_[1]; window.yfield = form.$_[2]; window.open(\"$gconfig{'webprefix'}/date_chooser.cgi?day=\"+encodeURIComponent(dfield.value)+\"&month=\"+encodeURIComponent(mfield.selectedIndex)+\"&year=\"+yfield.value, \"chooser\", \"toolbar=no,menubar=no,scrollbars=yes,width=$w,height=$h\")' value=\"...\">\n";
}

sub theme_popup_window_button {
    my ( $url, $w, $h, $scroll, $fields ) = @_;
    my $scrollyn = $scroll ? "yes" : "no";
    my $rv
        = "<input class='btn btn-default' style='height: 34px; vertical-align:middle !important;' type=button onClick='";
    foreach my $m (@$fields) {
        $rv .= "$m->[0] = form.$m->[1]; ";
    }
    my $sep = $url =~ /\?/ ? "&" : "?";
    $rv .= "chooser = window.open(\"$url\"";
    foreach my $m (@$fields) {
        if ( $m->[2] ) {
            $rv .= "+\"$sep$m->[2]=\"+encodeURIComponent($m->[0].value)";
            $sep = "&";
        }
    }
    $rv
        .= ", \"chooser\", \"toolbar=no,menubar=no,scrollbars=$scrollyn,resizable=yes,width=$w,height=$h\"); ";
    foreach my $m (@$fields) {
        $rv .= "chooser.$m->[0] = $m->[0]; ";
        $rv .= "window.$m->[0] = $m->[0]; ";
    }
    $rv .= "' value=\"...\">";
    return $rv;
}

sub theme_ui_upload {
    my ( $name, $size, $dis, $tags ) = @_;
    $size = &ui_max_text_width($size);
    return
          "<input style='margin: 4px 0;' class='ui_upload' type=file name=\""
        . &quote_escape($name) . "\" "
        . "size=$size "
        . ( $dis  ? "disabled=true" : "" )
        . ( $tags ? " " . $tags     : "" ) . ">";
}

sub theme_icons_table {
    print '<div class="row icons-row">' . "\n";
    for ( my $i = 0; $i < @{ $_[0] }; $i++ ) {
        print '<div style="text-align: left;" class="col-sm-4">' . "\n";
        &generate_icon( $_[2]->[$i], $_[1]->[$i], $_[0]->[$i],
            ref( $_[4] ) ? $_[4]->[$i] : $_[4],
            $_[5], $_[6], $_[7]->[$i], $_[8]->[$i] );
        print '</div>' . "\n";
    }
    print '</div>' . "\n";
}

sub theme_generate_icon {
    my ( $icon, $title, $link, $href, $width, $height, $before, $after ) = @_;
    $width  = !defined($width)  ? '48' : $width;
    $height = !defined($height) ? '48' : $height;

    if ( $tconfig{'noicons'} ) {
        if ($link) {
            print '<div>';
            print $before;
            print '<a href="' . $link . '" ' . $href . '>' . $title . '</a>';
            print $after;
            print '</div>';
        }
        else {
            print '<div>';
            print $before;
            print $title;
            print $after;
            print '</div>';
        }
    }
    if ( &get_module_name() ne 'sysstats' ) {
        if ($link) {
            print '<div>';

            #print '<a href="' . $link . '" ' . $href . '>';
            print $before;
            print '<a href="' . $link . '" ' . $href . '><p>' . $title
                . '</p></a>';
            print $after;
            print '</div>';
        }
        else {
            print '<div>';
            print
                '<img style="padding: 7px; border-radius: 4px; border: 1px solid #DDD; background: linear-gradient(to bottom, #FCFCFC 0%, #F5F5F5 100%) repeat scroll 0% 0% transparent; width: 64px; height: 64px; box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.05);" src="'
                . $icon
                . '" width="'
                . $width
                . '" height="'
                . $height . '">';
            print $before;
            print '<p>' . $title . '</p>';
            print $after;
            print '</div>';
        }
    }
    else {
        if ($link) {
            print
                '<div style="height: 120px; text-align: center !important" class="icon-container">';
            print '<a href="'
                . $link . '" '
                . $href
                . '><img style="padding: 7px; border-radius: 4px; border: 1px solid #DDD; background: linear-gradient(to bottom, #FCFCFC 0%, #F5F5F5 100%) repeat scroll 0% 0% transparent; box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.05);" src="'
                . $icon
                . '" width="'
                . $width
                . '" height="'
                . $height . '">';
            print $before;
            print '<a href="'
                . $link . '" '
                . $href
                . '><p style="text-align: center !important">'
                . $title
                . '</p></a>';
            print $after;
            print '</div>';
        }
        else {
            print '<div class="icon-container">';
            print
                '<img style="padding: 7px; border-radius: 4px; border: 1px solid #DDD; background: linear-gradient(to bottom, #FCFCFC 0%, #F5F5F5 100%) repeat scroll 0% 0% transparent; width: box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.05);" src="'
                . $icon
                . '" width="'
                . $width
                . '" height="'
                . $height . '">';
            print $before;
            print '<p style="text-align: center !important">' . $title
                . '</p>';
            print $after;
            print '</div>';
        }
    }
}

sub theme_ui_columns_start {
    my ( $heads, $width, $noborder, $tdtags, $title ) = @_;
    my ( $rv, $i );

    $rv .= '<table class="table table-striped table-condensed">' . "\n";
    $rv .= '<thead>' . "\n";
    $rv .= '<tr>' . "\n";
    for ( $i = 0; $i < @$heads; $i++ ) {
        $rv .= '<th>';
        $rv .= ( $heads->[$i] eq '' ? '<br>' : $heads->[$i] );
        $rv .= '</th>' . "\n";
    }
    $rv .= '</tr>' . "\n";
    $rv .= '</thead>' . "\n";

    return $rv;
}

sub theme_ui_columns_row {
    my ( $cols, $tdtags ) = @_;
    my ( $rv, $i );

    $rv .= '<tr class="tr_tag">' . "\n";
    for ( $i = 0; $i < @$cols; $i++ ) {
        $rv .= '<td class="td_tag">' . "\n";
        $rv .= ( $cols->[$i] !~ /\S/ ? '<br>' : $cols->[$i] );
        $rv .= '</td>' . "\n";
    }
    $rv .= '</tr>' . "\n";

    return $rv;
}

sub theme_ui_columns_header {
    my ( $cols, $tdtags ) = @_;
    my ( $rv, $i );

    $rv .= '<thead>' . "\n";
    $rv .= '<tr>' . "\n";
    for ( $i = 0; $i < @$cols; $i++ ) {
        $rv .= '<th>';
        $rv .= ( $cols->[$i] eq '' ? '#' : $cols->[$i] );
        $rv .= '</th>' . "\n";
    }
    $rv .= '</tr>' . "\n";
    $rv .= '</thead>' . "\n";

    return $rv;
}

sub theme_ui_columns_end {
    my $rv;

    $rv .= '</table>' . "\n";

    return $rv;
}

sub theme_ui_form_start {
    my ( $script, $method, $target, $tags ) = @_;
    my $rv;

    $rv .= '<form class="ui_form" role="form" ';
    $rv .= 'action="' . &html_escape($script) . '" ';
    $rv .= (
          $method eq 'post' ? 'method="post" '
        : $method eq 'form-data'
        ? 'method="post" enctype="multipart/form-data" '
        : 'method="get" '
    );
    $rv .= ( $target ? 'target="' . $target . '" ' : '' );
    $rv .= ( $tags   ? $tags                       : '' );
    $rv .= '>' . "\n";

    return $rv;
}

sub theme_ui_form_end {
    $ui_formcount++;
    my ( $buttons, $width, $nojs ) = @_;
    my $rv;
    if ( $buttons && @$buttons ) {
        $rv
            .= "<table class='ui_form_end_buttons' "
            . ( $width ? " width=$width" : "" )
            . "><tr><td>\n";
        my $b;
        foreach $b (@$buttons) {
            if ( ref($b) ) {
                $rv .= "<span"
                    . (
                     !$width                            ? ""
                    : $b eq $buttons->[0]               ? " align=left"
                    : $b eq $buttons->[ @$buttons - 1 ] ? " align=right"
                    :                                     " align=center"
                    )
                    . ">"
                    . &ui_submit( $b->[1], $b->[0], $b->[3], $b->[4] )
                    . ( $b->[2] ? " " . $b->[2] : "" )
                    . "</span>\n";
            }
            elsif ($b) {
                $rv .= "<span>$b</span>\n";
            }
            else {
                $rv .= "<span>&nbsp;&nbsp;</span>\n";
            }
        }
        $rv .= "</td></tr></table>\n";
    }
    $rv .= "</form>\n";
    if ( !$nojs ) {

        # When going back to a form, re-enable any text fields generated by
        # ui_opt_textbox that aren't in the default state.
        $rv .= "<script type='text/javascript'>\n";
        $rv
            .= "var opts = document.getElementsByClassName('ui_opt_textbox');\n";
        $rv .= "for(var i=0; i<opts.length; i++) {\n";
        $rv
            .= "  opts[i].disabled = document.getElementsByName(opts[i].name+'_def')[0].checked;\n";
        $rv .= "}\n";
        $rv .= "</script>\n";
    }
    return $rv;
}

sub theme_ui_textbox {
    my ( $name, $value, $size, $dis, $max, $tags ) = @_;
    my $rv;

    $rv
        .= '<input style="display: inline; width: auto; max-width:93%; height: 34px; vertical-align: middle" class="form-control ui_textbox" type="text" ';
    $rv .= 'id="' . &quote_escape($name) . '" ';
    $rv .= 'name="' . &quote_escape($name) . '" ';
    $rv .= 'value="' . &quote_escape($value) . '" ';
    $rv .= ( $dis ? 'disabled="true" ' : '' );
    $fv .= ( $max ? 'maxlength="' . $max . '" ' : '' );
    $rv .= ( $tags ? $tags : '' );
    $rv .= '>' . "\n";

    return $rv;
}

sub theme_ui_password {
    my ( $name, $value, $size, $dis, $max, $tags ) = @_;
    my $rv;

    $rv
        .= '<input style="display: inline; width: auto; max-width:93%; vertical-align:middle" class="form-control ui_password" type="password" ';
    $rv .= 'name="' . &quote_escape($name) . '" ';
    $rv .= 'value="' . &quote_escape($value) . '" ';
    $rv .= 'size="' . $size . '" ';
    $rv .= ( $dis ? 'disabled="true" ' : '' );
    $fv .= ( $max ? 'maxlength="' . $max . '" ' : '' );
    $rv .= ( $tags ? $tags : '' );
    $rv .= '>' . "\n";

    return $rv;
}

sub theme_ui_radio {
    my ( $name, $value, $opts, $dis ) = @_;
    my ( $rv, $o );
    foreach $o (@$opts) {
        my $id = &quote_escape( $name . "_" . $o->[0] );
        my $label = $o->[1] || $o->[0];
        my $after;
        if ( $label
            =~ /^([\000-\377]*?)((<a\s+href|<input|<select|<textarea)[\000-\377]*)$/i
            )
        {
            $label = $1;
            $after = $2;
        }
        $rv .= '<input class="ui_radio" type="radio" ';
        $rv .= 'name="' . &quote_escape($name) . '" ';
        $rv .= 'value="' . &quote_escape( $o->[0] ) . '" ';
        $rv .= ( $o->[0] eq $value ? 'checked ' : '' );
        $rv .= ( $dis ? 'disabled="true" ' : '' );
        $rv .= 'id="' . $id . '" ';
        $rv .= $o->[2] . ' ';
        $rv .= '>' . "\n";
        $rv .= '<label class="radio" ';
        $rv .= 'for="' . $id . '">' . "\n";
        $rv .= '<i class="fa"></i> ' . $label . "\n";
        $rv .= '</label>' . $after . "\n";
    }

    return $rv;
}

sub theme_ui_yesno_radio {
    my ( $name, $value, $yes, $no, $dis ) = @_;
    my $rv;

    $yes = 1 if ( !defined($yes) );
    $no  = 0 if ( !defined($no) );
    $value = int($value);

    $rv .= &ui_radio( $name, $value,
        [ [ $yes, $text{'yes'} ], [ $no, $text{'no'} ] ], $dis );

    return $rv;
}

sub theme_ui_checkbox {
    my ( $name, $value, $label, $sel, $tags, $dis ) = @_;
    my $after;
    if ( $label =~ /^([^<]*)(<[\000-\377]*)$/ ) {
        $label = $1;
        $after = $2;
    }
    return
          "<input type='checkbox' "
        . "name=\""
        . &quote_escape($name) . "\" "
        . "value=\""
        . &quote_escape($value) . "\" "
        . ( $sel ? " checked"       : "" )
        . ( $dis ? " disabled=true" : "" )
        . " id=\""
        . &quote_escape("${name}_${value}") . "\""
        . ( $tags ? " " . $tags : "" ) . "> "
        . (
         !$label
        ? $after
        : "<label class='checkbox' for=\""
            . &quote_escape("${name}_${value}")
            . "\">$label</label>$after"
        ) . "\n";
}

sub theme_ui_textarea {
    my ( $name, $value, $rows, $cols, $wrap, $dis, $tags ) = @_;
    $cols = &ui_max_text_width( $cols, 1 );

    return
        "<textarea style='display: inline; width:100%;' class='form-control ui_textarea' "
        . "name=\""
        . &quote_escape($name) . "\" " . "id=\""
        . &quote_escape($name) . "\" "
        . "rows='$rows' cols='$cols'"
        . ( $wrap ? " wrap=$wrap"    : "" )
        . ( $dis  ? " disabled=true" : "" )
        . ( $tags ? " $tags"         : "" ) . ">"
        . &html_escape($value)
        . "</textarea>";
}

sub theme_ui_submit {
    my ( $label, $name, $dis, $tags ) = @_;

    return
          "<input class='btn btn-default submitter ui_submit' type='submit'"
        . ( $name ne '' ? " name=\"" . &quote_escape($name) . "\"" : "" )
        . ( $name ne '' ? " id=\"" . &quote_escape($name) . "\""   : "" )
        . " value=\""
        . &quote_escape($label) . "\""
        . ( $dis  ? " disabled=true" : "" )
        . ( $tags ? " " . $tags      : "" ) . ">\n";
}

sub theme_ui_reset {
    my ( $label, $dis ) = @_;
    my $rv;

    $rv
        .= '<button class="btn btn-default ui_reset" style="height: 34px; vertical-align:middle" type="reset" ';
    $rv .= ( $dis ? 'disabled="disabled">' : '>' );
    $rv .= &quote_escape($label);
    $rv .= '</button>' . "\n";

    return $rv;
}

sub theme_ui_button {
    my ( $label, $name, $dis, $tags ) = @_;
    my $rv;

    $rv .= '<button type="button" class="btn btn-default ui_button" ';
    $rv .= ( $name ne '' ? 'name="' . &quote_escape($name) . '" ' : '' );
    $rv .= ( $dis ? 'disabled="disabled"' : '' );
    $rv .= ( $tags ? ' ' . $tags : '' ) . '>';
    $rv .= &quote_escape($label);
    $rv .= '</button>' . "\n";

    return $rv;
}

sub theme_ui_post_header {
    my ($text) = @_;
    my $rv;

    return $rv;
}

sub theme_ui_pre_footer {
    my $rv;
    $rv .= '</div>' . "\n";
    $rv .= '</div>' . "\n";

    return $rv;
}

sub theme_ui_tabs_start {
    my ( $tabs, $name, $sel, $border ) = @_;
    my $rv;

    $rv .= '<ul class="nav nav-tabs">' . "\n";
    foreach my $t (@$tabs) {
        my $tabid = "tab_" . $t->[0];
        if ( $t->[0] eq $sel ) {
            $rv
                .= '<li class="active"><a data-toggle="tab" onclick="return tab_action(\''
                . $name
                . '\', \''
                . $t->[0]
                . '\')" href="#'
                . $t->[0] . '">'
                . $t->[1]
                . '</a></li>' . "\n";
        }
        else {
            $rv
                .= '<li><a data-toggle="tab" onclick="return tab_action(\''
                . $name
                . '\', \''
                . $t->[0]
                . '\')" href="#'
                . $t->[0] . '">'
                . $t->[1]
                . '</a></li>' . "\n";
        }
    }
    $rv .= '</ul>' . "\n";
    $rv .= '<div class="tab-content">' . "\n";
    $main::ui_tabs_selected = $sel;
    $rv .= &ui_hidden( $name, $sel ) . "\n";

    return $rv;
}

sub theme_ui_tabs_end {
    my ($border) = @_;
    my $rv;

    $rv .= '</div>' . "\n";

    return $rv;
}

sub theme_ui_tabs_start_tab {
    my ( $name, $tab ) = @_;
    my $rv;
    my $defclass = $tab eq $main::ui_tabs_selected ? 'active' : '';

    $rv
        .= '<div id="'
        . $tab
        . '" class="tab-pane '
        . $defclass . '">' . "\n";

    return $rv;
}

sub theme_ui_tabs_end_tab {
    my $rv;

    $rv .= '</div>' . "\n";

    return $rv;
}

sub theme_ui_hr {
    my $rv;

    $rv .= '<hr>' . "\n";

    return $rv;
}

sub theme_ui_alert_box {
    my ( $msg, $class ) = @_;
    my ( $rv, $type, $tmsg, $fa );

    if ( $class eq "success" ) {
        $type = 'alert-success', $tmsg = 'Success!', $fa = 'fa-check-circle';
    }
    elsif ( $class eq "info" ) {
        $type = 'alert-info', $tmsg = 'Information!', $fa = 'fa-info-circle';
    }
    elsif ( $class eq "warn" ) {
        $type = 'alert-warning', $tmsg = 'Warning!',
            $fa = 'fa-exclamation-triangle';
    }
    elsif ( $class eq "danger" ) {
        $type = 'alert-danger', $tmsg = 'Danger!', $fa = 'fa-bolt';
    }

    $rv
        .= '<div class="alert '
        . $type
        . '" style="margin-bottom: 4px;">' . "\n";
    $rv
        .= '<i class="fa fa-fw '
        . $fa
        . '"></i> <strong>'
        . $tmsg
        . '</strong>';
    $rv .= '<br>' . "\n";
    $rv .= $msg . "\n";
    $rv .= '</div>' . "\n";

    return $rv;
}

sub theme_ui_table_start {
    my ( $heading, $tabletags, $cols, $tds, $rightheading ) = @_;
    if ( defined($main::ui_table_cols) ) {

        push( @main::ui_table_cols_stack, $main::ui_table_cols );
        push( @main::ui_table_pos_stack,  $main::ui_table_pos );
        push( @main::ui_table_default_tds_stack,
            $main::ui_table_default_tds );
    }
    my $colspan = 1;
    my $rv;
    $rv
        .= "<div class='table-responsive'><table class='table table-striped table-rounded table-condensed table-subtable' $tabletags>\n";
    if ( defined($heading) || defined($rightheading) ) {
        $rv .= "<thead><tr>";
        if ( defined($heading) ) {
            $rv .= "<th class='table-title'><b>$heading</b></th>";
        }
        if ( defined($rightheading) ) {
            $rv .= "<th>$rightheading</th>";
            $colspan++;
        }
        $rv .= "</tr></thead>\n";
    }
    $rv .= "<tbody> <td>"
        . "<table class='sub_table_container' width=100%>\n";
    $main::ui_table_cols        = $cols || 4;
    $main::ui_table_pos         = 0;
    $main::ui_table_default_tds = $tds;
    return $rv;
}

sub theme_ui_table_end {
    my $rv;
    if ( $main::ui_table_cols == 4 && $main::ui_table_pos ) {

        $rv .= &ui_table_row( " ", " " );
    }
    if (@main::ui_table_cols_stack) {
        $main::ui_table_cols        = pop(@main::ui_table_cols_stack);
        $main::ui_table_pos         = pop(@main::ui_table_pos_stack);
        $main::ui_table_default_tds = pop(@main::ui_table_default_tds_stack);
    }
    else {
        $main::ui_table_cols        = undef;
        $main::ui_table_pos         = undef;
        $main::ui_table_default_tds = undef;
    }
    $rv .= "</table></td></tbody></table></div>\n";
    return $rv;
}

sub theme_ui_table_row {
    my ( $label, $value, $cols, $tds ) = @_;
    $cols ||= 1;
    $tds  ||= $main::ui_table_default_tds;
    my $rv;
    if (   $main::ui_table_pos + $cols + 1 > $main::ui_table_cols
        && $main::ui_table_pos != 0 )
    {
        $rv .= "</tr>\n";
        $main::ui_table_pos = 0;
    }
    $rv .= "<tr>\n"
        if ( $main::ui_table_pos % $main::ui_table_cols == 0 );
    $rv .= "<td class='col_label'><b>$label</b></td>\n"
        if ( defined($label) );
    $rv .= "<td colspan=$cols class='col_value'>$value</td>\n";
    $main::ui_table_pos += $cols + ( defined($label) ? 1 : 0 );
    if ( $main::ui_table_pos % $main::ui_table_cols == 0 ) {
        $rv .= "</tr>\n";
        $main::ui_table_pos = 0;
    }
    return $rv;
}

sub theme_ui_table_hr {
    my $rv;
    if ($ui_table_pos) {
        $rv .= "</tr>\n";
        $ui_table_pos = 0;
    }
    $rv .= "<tr> "
        . "<td colspan=$main::ui_table_cols class='no-border'><hr></td></tr>\n";
    return $rv;
}

sub theme_ui_opt_textbox {
    my ( $name, $value, $size, $opt1, $opt2, $dis, $extra, $max, $tags ) = @_;
    my $dis1 = &js_disable_inputs( [ $name, @$extra ], [] );
    my $dis2 = &js_disable_inputs( [], [ $name, @$extra ] );
    my $rv;
    $size = &ui_max_text_width($size);
    $rv .= &ui_radio(
        $name . "_def",
        $value eq '' ? 1 : 0,
        [   [ 1, $opt1, "onClick='$dis1'" ],
            [ 0, $opt2 || " ", "onClick='$dis2'" ]
        ],
        $dis
    ) . "\n";
    $rv
        .= "<span><input class='ui_opt_textbox form-control' style='display: inline; width: auto; height: 34px; min-width: 15%;margin-right:2px;' type='text' name=\""
        . &quote_escape($name) . "\" "
        . "size=$size value=\""
        . &quote_escape($value) . "\""
        . ( $dis  ? " disabled=true"  : "" )
        . ( $max  ? " maxlength=$max" : "" )
        . ( $tags ? " " . $tags       : "" )
        . "></span>";
    return $rv;
}

sub theme_ui_checked_columns_row {
    my ( $cols, $tdtags, $checkname, $checkvalue, $checked, $disabled, $tags )
        = @_;
    my $rv;
    $rv
        .= "<tr"
        . ( $cb ? " " . $cb : "" )
        . " class='ui_checked_columns'>\n";
    $rv
        .= "<td class='ui_checked_checkbox' "
        . $tdtags->[0] . ">"
        . &ui_checkbox( $checkname, $checkvalue, undef, $checked, $tags,
        $disabled )
        . "</td>\n";
    my $i;
    for ( $i = 0; $i < @$cols; $i++ ) {
        $rv .= "<td " . $tdtags->[ $i + 1 ] . ">";
        if ( $cols->[$i] !~ /<a\s+href|<input|<select|<textarea/ ) {
            $rv .= "<label for=\""
                . &quote_escape("${checkname}_${checkvalue}") . "\">";
        }
        $rv .= ( $cols->[$i] !~ /\S/ ? "<br>" : $cols->[$i] );
        if ( $cols->[$i] !~ /<a\s+href|<input|<select|<textarea/ ) {
            $rv .= "</label>";
        }
        $rv .= "</td>\n";
    }
    $rv .= "</tr>\n";
    return $rv;
}

sub theme_ui_hidden_javascript {
    my $rv;
    my $imgdir = "$gconfig{'webprefix'}/images";
    my ( $jscb, $jstb ) = ( $cb, $tb );
    $jscb =~ s/'/\\'/g;
    $jstb =~ s/'/\\'/g;

    return <<EOF;
    <style type='text/css'>

    </style>
    <script type='text/javascript'>
    // Open or close a hidden section
    function hidden_opener(divid, openerid)
    {
    var divobj = document.getElementById(divid);
    if (divobj.className == 'opener_shown') {
        \$("#" + divid).parent('.opener_container').show().find("#" + divid).slideUp(300, function () {
            \$("#" + divid).removeClass('opener_shown').addClass('opener_hidden').parent('.opener_container').hide();
        });
      }
    else {
        \$("#" + divid).slideUp(0).removeClass('opener_hidden').addClass('opener_shown').parent('.opener_container').slideDown(300).find('.opener_shown').slideDown(300);
      }
    }

    // Show a tab
    function select_tab(name, tabname, form)
    {
    var tabnames = document[name+'_tabnames'];
    var tabtitles = document[name+'_tabtitles'];
    for(var i=0; i<tabnames.length; i++) {
      var tabobj = document.getElementById('tab_'+tabnames[i]);
      var divobj = document.getElementById('div_'+tabnames[i]);
      var title = tabtitles[i];
      if (tabnames[i] == tabname) {
        // Selected table
        tabobj.innerHTML = '<table cellpadding=0 cellspacing=0><tr>'+
                   '<td valign=top $jscb>'+
                   '<img src=$imgdir/lc2.gif alt=""></td>'+
                   '<td $jscb nowrap>'+
                   '&nbsp;<b>'+title+'</b>&nbsp;</td>'+
                       '<td valign=top $jscb>'+
                   '<img src=$imgdir/rc2.gif alt=""></td>'+
                   '</tr></table>';
        divobj.className = 'opener_shown';
        }
      else {
        // Non-selected tab
        tabobj.innerHTML = '<table cellpadding=0 cellspacing=0><tr>'+
                   '<td valign=top $jstb>'+
                   '<img src=$imgdir/lc1.gif alt=""></td>'+
                   '<td $jstb nowrap>'+
                           '&nbsp;<a href=\\'\\' onClick=\\'return select_tab("'+
                   name+'", "'+tabnames[i]+'")\\'>'+title+'</a>&nbsp;</td>'+
                   '<td valign=top $jstb>'+
                       '<img src=$imgdir/rc1.gif alt=""></td>'+
                   '</tr></table>';
        divobj.className = 'opener_hidden';
        }
      }
    if (document.forms[0] && document.forms[0][name]) {
      document.forms[0][name].value = tabname;
      }
    return false;
    }
    </script>
EOF
}

sub theme_ui_hidden_start {

    my ( $title, $name, $status, $url ) = @_;
    my $rv;
    if ( !$main::ui_hidden_start_donejs++ ) {
        $rv .= &ui_hidden_javascript();
    }
    my $divid    = "hiddendiv_$name";
    my $openerid = "hiddenopener_$name";
    my $defimg
        = $status
        ? ""
        : "";
    my $defclass = $status ? 'opener_shown' : 'opener_hidden';
    $rv
        .= "<a href=\"javascript:hidden_opener('$divid', '$openerid')\" id='$openerid'>$defimg</a>\n";
    $rv
        .= "<a href=\"javascript:hidden_opener('$divid', '$openerid')\">$title</a><br>\n";
    $rv .= "<div class='$defclass' id='$divid'>\n";
    return $rv;
}

sub theme_ui_hidden_table_start {
    my ( $heading, $tabletags, $cols, $name, $status, $tds, $rightheading )
        = @_;
    my $rv;
    if ( !$main::ui_hidden_start_donejs++ ) {
        $rv .= &ui_hidden_javascript();
    }
    my $divid    = "hiddendiv_$name";
    my $openerid = "hiddenopener_$name";
    my $defimg
        = $status
        ? ""
        : "";
    my $defclass
        = $status
        ? 'opener_shown'
        : 'opener_hidden';
    my $text
        = defined( $tconfig{'cs_text'} ) ? $tconfig{'cs_text'}
        : defined( $gconfig{'cs_text'} ) ? $gconfig{'cs_text'}
        :                                  "f00";
    $rv
        .= "<table class='table table-striped table-rounded table-condensed' $tabletags>\n";
    my $colspan = 1;

    if ( defined($heading) || defined($rightheading) ) {
        $rv .= "<tr" . ( $tb ? " " . $tb : "" ) . "><td>";
        if ( defined($heading) ) {
            $rv
                .= "<a class='opener_trigger' href=\"javascript:hidden_opener('$divid', '$openerid')\" id='$openerid'>$defimg</a> <a class='opener_trigger' href=\"javascript:hidden_opener('$divid', '$openerid')\">$heading</a></td>";
        }
        if ( defined($rightheading) ) {
            $rv .= "<td align=right>$rightheading</td>";
            $colspan++;
        }
        $rv .= "</td> </tr>\n";
    }
    $rv
        .= "<tr"
        . ( $cb ? " " . $cb : "" )
        . "><td class='opener_container' colspan=$colspan><div class='$defclass' id='$divid'><table width=100%>\n";
    $main::ui_table_cols        = $cols || 4;
    $main::ui_table_pos         = 0;
    $main::ui_table_default_tds = $tds;
    return $rv;
}

sub theme_ui_buttons_row {
    my ( $script, $label, $desc, $hiddens, $after, $before ) = @_;
    if ( ref($hiddens) ) {
        $hiddens = join( "\n", map { &ui_hidden(@$_) } @$hiddens );
    }
    return
          "<form action='$script' class='ui_buttons_form'>\n"
        . $hiddens
        . "<tr class='ui_buttons_row'> "
        . "<td nowrap width=20% valign=top class=ui_buttons_label>"
        . ( $before ? $before . " " : "" )
        . &ui_submit($label)
        . ( $after ? " " . $after : "" )
        . "</td>\n"
        . "<td width=80% valign=top class=ui_buttons_value>"
        . $desc
        . "</td></tr>\n"
        . "</form>\n";
}

sub theme_ui_radio_table {
    my ( $name, $sel, $rows, $nobold ) = @_;
    return "" if ( !@$rows );
    my $rv = "<table class='ui_radio_table'>\n";
    foreach my $r (@$rows) {
        $rv .= "<tr>\n";
        $rv
            .= "<td"
            . ( defined( $r->[2] ) ? "" : " colspan=2" ) . ">"
            . ( $nobold            ? "" : "<b>" )
            . &ui_oneradio( $name, $r->[0], $r->[1], $r->[0] eq $sel,
            $r->[3] )
            . ( $nobold ? "" : "</b>" )
            . "</td>\n";
        if ( defined( $r->[2] ) ) {
            $rv .= "<td>" . $r->[2] . "</td>\n";
        }
        $rv .= "</tr>\n";
    }
    $rv .= "</table>\n";
    return $rv;
}

$main::cloudmin_no_create_links = 1;
$main::cloudmin_no_edit_buttons = 1;
$main::cloudmin_no_global_links = 1;

$main::mailbox_no_addressbook_button = 1;
$main::mailbox_no_folder_button      = 1;

$main::basic_virtualmin_menu          = 1;
$main::basic_virtualmin_domain        = 1;
$main::nocreate_virtualmin_menu       = 1;
$main::nosingledomain_virtualmin_mode = 1;
