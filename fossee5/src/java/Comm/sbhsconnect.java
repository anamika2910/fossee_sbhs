/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Comm;

import gnu.io.CommPort;
import gnu.io.CommPortIdentifier;
import gnu.io.NoSuchPortException;
import gnu.io.PortInUseException;
import gnu.io.SerialPort;
import gnu.io.UnsupportedCommOperationException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/**
 *
 * @author root
 */
public class sbhsconnect {
    
    
    public SerialPort connect ( String portName ) throws PortInUseException, UnsupportedCommOperationException, IOException 
    { 
            SerialPort serialPort=null;
    	    CommPort commPort=null;
        CommPortIdentifier portIdentifier=null;
        try {
            portIdentifier = CommPortIdentifier.getPortIdentifier(portName);
        } catch (NoSuchPortException ex) {
            return null;
        }
    Double a=0.0;
    
    	
       if ( portIdentifier.isCurrentlyOwned() )
        {
            System.out.println("Error: Port is currently in use"+portIdentifier.getCurrentOwner());
           
            return null;
        }
        else
       {
            commPort = portIdentifier.open(this.getClass().getName(),2000);  
            if ( commPort instanceof SerialPort )
            {
               serialPort = (SerialPort) commPort;
                serialPort.setSerialPortParams(9600,SerialPort.DATABITS_8,SerialPort.STOPBITS_1,SerialPort.PARITY_NONE);
                
               
            }
            else
            {
                System.out.println("Error: Only serial ports are handled by this example.");
            }
        }     
      return serialPort;
    }
}