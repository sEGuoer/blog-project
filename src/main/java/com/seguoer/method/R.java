package com.seguoer.method;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.http.HttpStatus;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class R {
    private Integer code;
    private String msg;
    private Object data;
    public static R ok(Object data){
        return new R(HttpStatus.OK.value(),HttpStatus.OK.getReasonPhrase(),data);
    }
    public static R ok(Integer state, Object data){
        return new R(state,HttpStatus.OK.getReasonPhrase(),data);
    }
    public static R ok(){
        return new R(HttpStatus.OK.value(),HttpStatus.OK.getReasonPhrase(),"ok");
    }
}
