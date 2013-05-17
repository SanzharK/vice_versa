<html>
    <head>
        <meta name="layout" content="main"/>
       <r:require module="application"/>
       <r:layoutResources />
    </head>
    <body>
        <h3>Checkout</h3>
        
        
        <g:form action="charge" method="POST" name="payment-form">
            <div class="form-row">
                <label>Amount (USD)</label>
                <input type="text" size="20" autocomplete="off" id="amount" name="amount"/>
            </div>
            
            <stripe:creditCardInputs cssClass="form-row"/>     
 
            <button type="submit" class="submit-button">Submit Payment</button>
        </g:form>
    </body>
</html>