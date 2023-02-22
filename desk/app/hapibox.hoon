/+  dbug, default-agent, server, schooner
/*  auth  %html  /app/ex/auth/html
/*  poke  %html  /app/ex/poke/html
/*  sub-unsub  %html  /app/ex/sub-unsub/html
/*  sub1  %html  /app/ex/sub1/html
/*  scry  %html  /app/ex/scry/html
/*  ted  %html  /app/ex/ted/html
|%
+$  versioned-state
  $%  state-0
  ==
+$  state-0  [%0 ~]
+$  card  card:agent:gall
--
%-  agent:dbug
^-  agent:gall
=|  state-0
=*  state  -
|_  =bowl:gall
+*  this  .
    def  ~(. (default-agent this %.n) bowl)
::
++  on-init
  ^-  (quip card _this)
  :_  this
  [%pass /eyre/connect %arvo %e %connect `/apps/hapibox %hapibox]~
::
++  on-save
  ^-  vase
  !>(state)
::
++  on-load
  |=  old-state=vase
  ^-  (quip card _this)
  =/  old  !<(versioned-state old-state)
  ?-  -.old
    %0  `this(state old)
  ==
::
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  |^
  ?+    mark  (on-poke:def mark vase)
      %handle-http-request
    ?>  =(src.bowl our.bowl)
    =^  cards  state
      (handle-http !<([@ta =inbound-request:eyre] vase))
    [cards this]
  ==
  ++  handle-http
    |=  [eyre-id=@ta =inbound-request:eyre]
    ^-  (quip card _state)
    =/  ,request-line:server
      (parse-request-line:server url.request.inbound-request)
    =+  send=(cury response:schooner eyre-id)
    ::
    ?+    method.request.inbound-request  
      [(send 405 ~ %stock ~) state]
      ::
        %'GET'
      ?+    site  
          :_(state (send 404 ~ %plain "404 - Not Found"))
        ::
          [%apps %hapibox %auth ~]
        ?.  authenticated.inbound-request
          :_(state (send 302 ~ %login-redirect './apps/hapibox'))
        :_(state (send 200 ~ %html auth))
        ::
          [%apps %hapibox %poke ~]
        ?.  authenticated.inbound-request
          :_(state (send 302 ~ %login-redirect './apps/hapibox'))
        :_(state (send 200 ~ %html poke))
        ::
          [%apps %hapibox %sub-unsub ~]
        ?.  authenticated.inbound-request
          :_(state (send 302 ~ %login-redirect './apps/hapibox'))
        :_(state (send 200 ~ %html sub-unsub))
        ::
          [%apps %hapibox %sub1 ~]
        ?.  authenticated.inbound-request
          :_(state (send 302 ~ %login-redirect './apps/hapibox'))
        :_(state (send 200 ~ %html sub1))
        ::
          [%apps %hapibox %scry ~]
        ?.  authenticated.inbound-request
          :_(state (send 302 ~ %login-redirect './apps/hapibox'))
        :_(state (send 200 ~ %html scry))
        ::
          [%apps %hapibox %ted ~]
        ?.  authenticated.inbound-request
          :_(state (send 302 ~ %login-redirect './apps/hapibox'))
        :_(state (send 200 ~ %html ted))
      == 
    ==
  --
++  on-peek  on-peek:def
++  on-watch
  |=  =path
  ^-  (quip card _this)
  ?+    path  (on-watch:def path)
      [%http-response *]
    `this
  ==
::
++  on-leave  on-leave:def
++  on-agent  on-agent:def
::
++  on-arvo
  |=  [=wire =sign-arvo]
  ^-  (quip card _this)
  ?+  sign-arvo  (on-arvo:def wire sign-arvo)
      [%eyre %bound *]
    ~?  !accepted.sign-arvo
      [dap.bowl 'eyre bind rejected!' binding.sign-arvo]
    [~ this]
  ==
::
++  on-fail  on-fail:def
--