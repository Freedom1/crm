package br.com.crm.session.impl;

import br.com.crm.session.ISessionTemplate;
import flex.messaging.FlexContext;
import flex.messaging.FlexSession;

public class SessionTemplate implements ISessionTemplate {

	private FlexSession flexSession;
    
    public SessionTemplate() {
        flexSession = FlexContext.getFlexSession();
    }
 
    public SessionTemplate getSession(){
        if(flexSession == null){
            flexSession = FlexContext.getFlexSession();
        }
        return this;
    }
    
//    public UsuarioModel getUsuarioSession()throws FlexSessionException{
//        UsuarioModel model = (UsuarioModel) flexSession.getAttribute("usuario");
//        this.validaModel(model);
//        return model;
//    }  
// 
//    public void setUsuarioSession(UsuarioModel model) throws FlexSessionException{
//        flexSession.setAttribute("usuario", model);
//    }
    
//    private void validaModel(Object model) throws FlexSessionException{
//        if(model == null){
//            throw new FlexSessionException("Tempo limite de inatividade atingido!");
//        }
//    }
}
