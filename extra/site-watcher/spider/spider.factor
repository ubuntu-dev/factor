! Copyright (C) 2009 Slava Pestov.
! See http://factorcode.org/license.txt for BSD license.
USING: site-watcher.db site-watcher.email
spider spider.report
accessors kernel sequences
xml.writer ;
IN: site-watcher.spider

: <site-spider> ( spidering-site -- spider )
    [ max-depth>> ]
    [ max-count>> ]
    [ site>> url>> ]
    tri
    <spider>
        swap >>max-count
        swap >>max-depth ;

: spider-and-email ( spidering-site -- )
    [ ]
    [ <site-spider> run-spider spider-report xml>string ]
    [ site>> url>> "Spidered " prefix ] tri
    send-site-email ;
