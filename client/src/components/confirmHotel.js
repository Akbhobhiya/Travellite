import React, {Component} from 'react';
import {StripeProvider, injectStripe} from 'react-stripe-elements';
import StripeCheckout from 'react-stripe-checkout';
import {Navbar} from './navbar';
import {Redirect } from 'react-router-dom';
import "../styles/confirmBooking.css";

const path = require('path');
require('dotenv').config();





export class ConfirmHotel extends Component{
    constructor() {
        super();
        this.state={
            redirectToThankyou:false
        }
        this.handleToken=this.handleToken.bind(this);
    }
    async handleToken(token)
    {
        let obj={
            hotelid:this.props.hotelResp.id,
            rooms:this.props.rooms,
            checkin:this.props.checkin,
            checkout:this.props.checkout,
            paymentid : 1,
        }

        const response=await fetch("http://localhost:3001/bookings/add",{
        method:"POST",
        headers: {
            "Content-Type" : "application/json" ,
        },
        body: JSON.stringify(obj)
        })
        console.log(response)
        if(response.ok) {
            this.setState({redirectToThankyou:true})
        }
        else
        {
            alert("Error");
        }

        /*console.log(token);
        var name=this.props.hotelResp.hotel_name;
        var amt=this.props.prc;
        let obj={
            product :{
                name:name,
                price:amt 
            },
            token:token           
        }

        const response=await fetch("http://localhost:8081/checkout",{
        method:"POST",
        headers: {
            "Content-Type" : "application/json" ,
        },
        body: JSON.stringify(obj)
        })
        console.log(response)
        if(response.ok) {
            this.setState({redirectToThankyou:true})
        }
        else
        {
            alert("Error");
        }*/
    }
    render() {
        if(this.state.redirectToThankyou===true)
        {
            return (<Redirect to="/thankyou"/>)
        }

        console.log(__dirname  );

        console.log(process.env)
        return (
            <div className="confirmBooking">
            <Navbar dealLogout={this.props.dealLogout}/>
            <div className="outsideContainer">
            <div style={{textAlign:"center"}}>
            <label align="center">Booking Details</label>
            </div>
            <div className="insideContainer">
            <h4>{this.props.hotelResp.name}</h4>
            <h5>Near {this.props.hotelResp.address}, {this.props.hotelResp.city}</h5>
            <p>Ratings : {this.props.hotelResp.Rating}</p>
            <p>Rooms Booked : {this.props.rooms}</p>
            <p>Dated : {this.props.checkin} to {this.props.checkout}</p>
            <h4 style={{color:"red"}}>Total Amount : {this.props.prc} INR</h4>
            <div style={{textAlign:"center"}} >
            <StripeCheckout stripeKey={process.env.REACT_APP_APIKEY} token={this.handleToken} 
             amount={this.props.prc*100}
             currency='INR' 
             name='TRAVELS'
             description= 'Make Your Payment'
             label= 'Make Payment' />
            </div>
            </div>
            
            </div>
            </div>
            
        )
    }
}





















































