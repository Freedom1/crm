package br.com.crm.session;

import mockit.Mock;
import mockit.MockClass;
import flex.messaging.FlexContext;
import flex.messaging.FlexSession;

@MockClass(realClass=FlexContext.class)
public class MockContext {
    public static FlexSession session;
    
    @SuppressWarnings("deprecation")
    @Mock
    public FlexSession getFlexSession(){
        System.out.println("Session Mockada");
            if(session == null){
            session = new FlexSession() {
 
                @Override
                public boolean isPushSupported() {
                    return false;
                }
 
                @Override
                public String getId() {
                    return null;
                }
            };
        }
        return session;
    }
}
