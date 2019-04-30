<?php
//
//Date of agreement
$date = "2/3/2018";
//
//Company name of the landlord
$landlord = "MUTALL INVESTMENT COMPANY LIMITED";
//
//Company name of the tenant.
$client_title = "THE CO-OPERATIVE BANK OF KENYA LIMITED";
$client_name = "copbank";
//
//The title no. of the premises.
$title = "NGONG/NGONG/17140";
//
//Ref name of the agreement.
$room_id = "34";
$room_name = "bank";
$agreement_ref = "$client_name/$room_name/room_no:$room_id";
//
//legal authority.
$lawyer = "Lawrence Karanja Advocate
            2nd Floor, Co-op Bank House
            Haile Selassie Avenue 
            PO Box 48231--00100
            Nairobi, Kenya
            ";
?>
<html>
    <head>
        <link href="https://fonts.googleapis.com/css?family=Mina" rel="stylesheet">
        <title>AGREEMENT</title>
        <style>
            div{
                 margin-bottom:30px 
            }
             li{
                 margin-bottom:10px;
                 margin-top:5px 
            }
             data{
                 text-decoration:underline;
                 font-weight:bold;
                 text-align:center 
            }
             body{
                 font-family:'Mina', sans-serif;
            }
             agreement{
                 text-align:center;
            }
             content{
                 padding: 0 18px;
                 background-color: white;
                 display: none;
                 overflow: hidden;
            }
             .accordion {
                 background-color: #eee;
                 color: #444;
                 cursor: pointer;
                 text-align: left;
                 padding:15px;
                 width:100%;
                 border: none;
                 outline: none;
                 transition: 0.4s ;
            }
            /* Add a background color to the button if it is clicked on (add the .active class with JS), and when you move the mouse over it (hover) */
             .accordion:hover {
                 background-color: #ccc;
            }

            *{
                box-sizing:border-box;
            }
            @media screen and (max-width: 1000px){
                .accordion {
                 text-align: center;
                 padding:30px;
                 width:100%;
                 border: none;
                 outline: none;
                 transition: 0.4s ;
            }   
             content{
                 padding: 0 18px;
                 font-size:22px;
                 background-color: white;
                 display: none;
                 overflow: hidden;
            }    
            }
            
             @media screen and (max-width: 500px){
                .accordion {
                 text-align: center;
                 padding:40px;
                 width:100%;
                 border: none;
                 outline: none;
                 transition: 0.4s ;
            }   
             content{
                 padding: 0 18px;
                 font-size:26px;
                 background-color: white;
                 display: none;
                 overflow: hidden;
            }    
            }
            @media screen and (max-width: 250px){
                .accordion {
                 text-align: center;
                 padding:40px;
                 width:100%;
                 border: none;
                 outline: none;
                 transition: 0.4s ;
            }   
             content{
                 padding: 0 18px;
                 font-size:32px;
                 background-color: white;
                 display: none;
                 overflow: hidden;
            }    
            }
        </style>
        <script>
            //scripts for executing javascript commands
            function toggle(section) {
                //show the text when this button is clicked
                var x = section.querySelector("content");
                //
                //let y be the style attribute from x
                var y = x.getAttribute("style");
                //
                //test whether y is display block
                if (y === "display:block") {
                    //
                    //change style attribute to display block
                    x.setAttribute("style", "display:none");
                } else {
                    //
                    //change style attribute to display block
                    x.setAttribute("style", "display:block");
                }


            }
        </script>
    </head>
    <body>
        <section id="s1" onclick="toggle(this)">
            <button class="accordion">Section 1</button>
            <content>
                <agreement>
                <p>DATED <data><?php echo $date; ?></data></p>
                <p><data><?php echo $landlord; ?></data></p>
                <p>TO</P>
                <p><data><?php echo $client_title; ?></data></p>
                <p>LEASE
                    OVER PREMISES SITUATED ON
                    TITLE NO. <data><?php echo $title; ?></data></p>
                <p><data><?php echo $agreement_ref; ?></data></p>
                <p>Drawn by: 
                    <data><?php echo $lawyer; ?></data></p>
                </agreement>
                IN THE MATTER OF THE LAND ACT NO.6 OF 2012
                IN THE MATTER OF THE LAND REGISTRATION ACT NO.3 OF 2012
                IN THE MATTER OF THE REGISTERED LAND ACT (CHAPTER 300) NOW REPEALED
                LEASE
                THIS LEASE is made the	day cl	Two Thousand and
                BETWEEN
                <data<?php echo $landlord; ?></data> whose address for purposes hereof is care of Post Office Box Number 374-00206 Kiserian, in the Republic of Kenya (hereinafter called the Landlord" which expression shall where the context so admits include its successors and assigns} of the one pair;
                AND
                <data><?php echo $client_title; ?></data> a body corporate duly established under the
                Companies Act and licensed to cany on banking business under the Banking Act whose address for purposes hereof is Post Office Box Number 46231- 00100 Nairobi in the said Republic (hereinafter called the “Tenant” which expression shall where the context so admits include its successors and assigns) of
                the other part.
                <br>
                WHEREAS:-
                </br>
                The Landlord is registered as the proprietor of ALL THAT piece of land TITLE NO. <data><?php echo $title; ?></data> together with all buildings and improvements erected and being thereon (hereinafter called the “land").
                The Landlord has  erected a building on the said piece or parcel of land (hereinafter called "the Building")
                which comprises inter alia offices, shops and the usual conveniences;
                The Landlord has agreed to grant a Lease of the premises forming a portion of the building more particularly descnbed in the First Schedule hereto (“hereinafter called "the Demised Premises!to the Tenant under the terms and conditions hereinafter mentioned,
                NOW THIS LEASE WITNESSETH that
                1 IN CONSIDERATION of the rent hereinafter reserved and of the covenants and agreements by the Tenant
                hereinafter contained the Landlord DOES HEREBY LEASE unto the Tenant ALL THAT the Demised

                Premises TOGETHER WITH the night to the Tenant and all persons authorised by the Tenant in common
                with the Landlord and the other tenants and occupiers (if any) of the Building and all persons duly
                authorised   by them (not otherwise lessees  to  use  the entrance halls   and  staircases, landings,  passages for the purposes only of ingress to and egress from the Building during the business hours hereinafter defined or as may from time to time be determined by the Landlord PROVIDED THAT if the Tenant shall give to the landlord  or  its  agent  reasonable notice  of   such  Tenants  desire  the Landlord  will  endeavor  to make suitable arrangements for the Tenant  and members of  the Tenant' s staff   to  obtain  access  to  the Demised Premises at such other times as the Tenant may require AND TOGETHER ALSO with the like right to use the lavatories and washing conveniences (not otherwise leased) in the Building as the same may be allocated by the Landlord AND TOGETHER ALSO in common with all other persons  entitled thereto and so far only as the Landlord has power to grant the same, with the free passage and  running of water,soil and electricity from and to the Demised Premises through the drams, pipes,wires, cables and meters in  or under the adjoining or adjacent property BUT EXCEPTING AND RESERVING unto the Landlord and the person or persons for the time being occupying any other part or parts of the Building the free passage and running of the water, soil and electricity from the adjoining or adjacent property through the drains, pipes, wires, cables and meters in or under the Demised Premises and the right of the Landlord to enter the Demised Premises at all reasonable times by prior appointment for the purpose of inspection, altering, adding to or repairing the same TO BE HELD by the Tenant as lessee for a Term more particularly  described  in  the  Second  Schedule  (hereinafter  called  “the Term”)  SUBJECT nevertheless to determination as hereinafter provided YIELDING AND therefor end thereout  during theTerm the rent in the amount and in the manner Third Schedule.
            </content>
        </section>
        <section id="s2" class="current" onclick="toggle(this)">
            <button class="accordion">Section 2</button>
            <content>
                <p>
                    2.	 The Tenant to the intent that the obligations set out may continue throughout the continuance of the Term hereby created covenants and agrees with the Landlord as follows:-
                <div>2.1	To pay the rent hereby reserved at the times and in the manner aforesaid clear of all deductions whatsoever;
                </div>
                <div>
                    2.2	To pay and indemnify the Landlord against Value Added Tax or any tax of a similar nature which
                    may be substituted for it or levied in addition to it chargeable in respect of any payment made by the Tenant
                    under any of terms of or in connection with this Lease or in respect of any payment
                    made by the Landlord where the Tenant agrees in this Lease to reimburse the Landlord for such payment;
                </div>
                <div>
                    2.3	To deposit with the Landlord forthwith the sum more particularly described in the Fourth Schedule being the equivalent of three months gross rent as a security deposit which sum shall be held by the Landlord to the credit of the Tenant's account and applied as hereinafter provided.
                </div>
                <div>
                    2.4	To pay all charges in respect of electricity and telephones installed in the Demished Premises as the same become due.
                </div>
                <div>
                    2.5	In the event of water being supplied separately to the Demised Premises to pay to the Landlord the cost of supplying and installing a meter AND to pay for all water so supplied to the   Demised
                    Premises AND to indemnify the Landlord against all actions proceedings claims and demands arising from any leakage or overflow of water from the Demised Premises save where such overflow or leakage is for causes not attributable to the Tenant or any of its agents/employees/licensees.
                </div>
                <div>
                    2.6 To take immediate possession of the Demised Premises and continue having such possession and not to part with possession without the written consent of the Landlord. If the Tenant shall for any reason vacate the Demised Premises without the written consent of the landlord or stop carrying on the business the Demised Premises were demised for then it shall become lawful for the Landlord to retake possession of the Demised Premises and the lease hereby granted shall thereby be determined AND PROVIDED ALWAYS that in the event of vacating the Demised Premises with the Landlord's consent as aforesaid the Tenant shall provide such caretaking and security arrangements as the Landlord and/or its insurers shall require up to such date and time as the Tenant shall vacate the premises which time and date shall have been notified to the Landlord.
                </div>
                <div>
                    2.7 Not to do or carry on any business or any service which may render abnormal or increase the consumption of water or electric power without the prior written consent of the Landlord who shall be entitled as a condition of giving such consent to demand such additional service charge	or rent as may suffice to cover the additional charges for water and power caused by such use.
                </div>
                <div>
                    2.8	To keep the Demised Premises in good and substantial tenantable repair and condition to thereasonable satisfaction of the Landlord (structural repairs and damage, fair wear and tear only excepted) and   also to permit the Landlord or its agents with or without workmen and others at all reasonable times during all reasonable working hours to enter into and upon the Demised
                    Premises with prior notice to the Tenant for the purpose of painting, repairing or otherwise dealing with the outside door or doors entering into the Demised Premises and the outside of all window frames in the Demised Premises; the Landlord causing as little inconvenience as necessary and maxing good any damage occasioned thereby.
                </div>
                <div>
                    2.9	Not to obstruct nor permit or suffer its servants, agents or licensees to obstruct in any manner the corridors, passage and staircase in the Building and not to place nor deposit anything in nor obstruct nor suffer anything to be placed or deposited or any obstruction made in the means of access to the Demised Premises or any forecourt area, yard or fire escape and not to cover up or obstruct nor suffer to be covered up or obstructed any glass windows in any manner whatsoever.
                </div>
                <div>
                    2.10	In the last year of the Term or  upon the Sooner  determination of the lease well and sufficiently to clean off if necessary and subject to the proviso hereinafter contained paint with two coats of plastic emulsion oil or other best paint and in such manner and style and of such color or occurs as the Landlord may reasonably determine all the inside parts of the Demised Premises previously painted and to clean off and polish all polished wood (if any) in a proper and
                    workmanlike manner and to the reasonable satisfaction of the Landlord PROVIDED ALWAYS that nothing herein contained shall require the Tenant to put or keep the Demised Premises in any better state or condition of decoration than they were at the commencement of the Term.
                </div>
                <div>
                    2.11	Not to introduce nor permit to be introduced into the Demised Premises or any part thereof any package, article or furniture, piece of machinery or other equipment or thing whatsoever having a weight which may strain or damage the Building or the Demised Premises unless and until lie individual weight of each such thing {and in the case of business machines and mechanical equipment also the s ling thereof with a view to the absorption and prevention of vibration noise arid annoyance) shall have first been approved in writing by the Landlord's Architect for the time
                    being AND ALSO NOT to install on the Demised Premises nor permit lo be installed therein any safe nor alter the position of any such safe without first obtaining the consent of the Landlord's said Architect to the placing of a safe of the size and weight and in the position intended AND ALSO NOT lo load the floors beyond the margin of safety prescribed by the Landlord’s said Architect or if no margin of safety is prescribed beyond a proper margin of safety (which it shall be the sole responsibility of the Tenant to ascertain) AND ALSO to indemnify' the Landlord against all actions, claims and demands arising from any breach of this sub-clause or resulting from the maximum floor stress of the demises premises being at any time exceeded.
                </div>
                <div>
                    2.12	To permit any agent employed by the Landlord or the Landlord to enter the Demised Premises for purposes of inspecting the same and in the ordinary course of his duty in the company of a member of the Tenant's staff (excepting only in Ihe case of emergency ).
                </div>
                <div>
                    2.13	To permit the Landlord and its agents and all other persons authorised by it with or without workmen and others and with all necessary toots, appliances and apparatus at any time with prior notice lo enter upon the Demised Premises accompanied as aforesaid (or without notice and forcibly in case of emergency) for the purpose of examining the condition thereof or of doing such  repairs , alterations additions improvements renewals as may pursuant to the covenant and agreement by the Landlord in that behalf hereinafter contained the Landlord causing as little inconvenience as necessary and making good any damage occasioned thereby PROVIDED HOWEVER that the rent hereby reserved snail not in any way be abated while such repairs, alterations, additions, improvements, renewals as aforesaid are being done nor shall the Landlord be liable to the Tenant in any way for loss or interruption of business of the Tenant arising therefrom or otherwise howsoever.
                </div>
                <div>
                    2.14	 Before the expiration of Twenty-one (21) days’ notice given by the Landlord to carry out any repairs for which the Tenant is liable under the Tenant's covenants and agreements herein contained; lo carry out the same in accordance with such notice and to the satisfaction cl the Landlord PROVIDED THAT if the Tenant shall fail to carry out such work within such time as aforesaid then the Landlord may thereupon cause the same lo be done and recover the cost
                    thereof from the  Tenant  but  without  prejudice to the  Landlords right to re -entry  hereinafter contained
                </div>
                <div>
                    2.15	Not to make without the previous molten consent of the Landlord first had and obtained (which consent shall not be unreasonably withheld) structural alterations. partitions or structural additions in or to the Demised Premises or to the Landlords  fixtures. if the Landlord shall grant
                    its consent then the following provisions shall apply -
                    ( i)  All drawings and specifications in respect of such alterations partitions or additions shall first be approved by the Landlord or its agent.
                    (ii) The Tenant shall at its own cost and expense obtain the approval of an appropriate Government and Local Authorities;
                    (iii) Any such alterations partitions additions installations or improvements shall be removed by the Tenant and the Tenant shall reinstate the Demised Premises to then original condition at the Tenant's own  expense and cost prior to the expiration or sooner determination o' this lease  PROVIDED ALWAYS that any improvements undertaken by the Tenant which are of a permanent nature shall be forfeited to the Landlord al the expiry or sooner determination of this lease upon such terms as the Landlord and Tenant may agree
                </div>
                <div>
                    2.16	To pay all costs, changes, expenses (including Advocates' costs aid Surveyor's fees) incurred by the Landlord for the purpose of or incidental to the preparation and service of any notice requiring the Tenant to remedy a breach of any of the covenants herein curtained or incident to the preparation and service schedule of dilapidation at the termination of the Term
                </div>
                <div>
                    2.17	To maintain in force throughout the Term insurance against damage of all plate glass in the Demised Premises and to produce to the Landing on demand the policy of such insurance end evidence of payment of the current premium. It is also the Tenant s resposibility to insure its equipment, fittings and fixtures against fire  theft and other perils.
                </div>
                <div>
                    2.18 Not to do nor permit  or suffer to be done anything whereby an y insu rance of the Building against loss or damage by fire may become void or voidable or where the rate of premium for any such insurance may be increased AND to repay to the Landlord all sums paid by way of increased premium and all expenses incurred by it in or about the .renewal of any such policy rendered necessary by a broach of It is covenant and agreement and to the intent that  such payments shall  be payable on the  day fixed tor the payment of the rent hereinbefore reserved next after demand therefor shall have been made to the Tenant and shall be recoverable as rent AJMD ALSO -n the event of any insurance moneys being withheld or wholly or partially recoverable by
                    reasons of any breach or non-observance of this present covenant to indemnity the Landlord in respect of ( the cost or a proportionate part thereof of rebuilding or reinstating the same
                </div>
                <div>
                    2.19	In the event of the Building or the Demised Premises or of the said fixtures and fittings of any part or parts thereof respectively or any part thereof or of the electrical equipment therein or any part thereof being damaged or destroyed by fire any time during the term and the insurance money under any insurance against fire effected thereon by the Landlord being wholly or partially irrecoverable by reason solely on the part of any act or default of the Tenant  or the Tenant’s servants, employees, agents, licensees or visitors then and in every such case forthwith {in addition to the sad rent) to pay to the Landlord the whole or (as the case may require) a fair proportion of the costs of completely re-building and reinstating the same; any disputes as lo the proportion to be so contributed by the Tenant or otherwise in respect of or arising out of this provision to be referred to arbitration in accordance with the provisions of the Arbitration Ad 1995 or any Act or Acts amending or replacing the same.
                </div>
                <div>
                    2.20	Not to transfer sublet or part with or share the possession of the Demised Premises or any part thereof without the prior written consent of the Landlord AND IT IS HEREBY EXPRESSLY AGREED AND DECLARED by and between the parties that upon any breach by the Tenant of this covenant and agreement if shall be lawful for the Landlord to re-enter upon the Demised Premises without notice and thereupon the Tern shall determine absolutely.     If this lease be transferred or it the Demised Premises or any part thereof be sublet or occupied by any person other than the Tenant, the Landlord may after default by the Tenant  collect the rent from the transferee, sub-lessee or occupant and apply the net amount collected in or towards satisfaction of the rent (including any additional rent payable hereunder) hereby reserved but no such transfer, subletting, occupancy or collection shall be deemed to be a waiver of this covenant and agreement or an acceptance of the transferee, sub lessee or occupant as Tenant or a release of the Tenant of the covenants and agreements on the Tenant' s part herein contained. For the purpose of this sub-clause and of the last preceding sub-clause if the Tenant is a private or public limited liability company the transfer of the beneficial interest in more than fifty per cent (50%) of
                    its issued share capital shall be deemed lo be a transfer .
                </div>
                <div>
                    2.21	Not to use the Demised Premises or any part thereof otherwise than as a bank premises and for ancillary purposes thereto The usage of the Demised Premises will be in accordance with the design of the Building and shall comply with the requirements (if any) of the Local Authority.
                </div>
                <div>
                    2.22	Not to paint affix or exhibit any name or willing or any signboard or advertisement in the landings or passages or upon or outside any entrance, hall, windows, roof or outside wall of the Building or  any landings or  passages giving  access thereto save in conformity  with the Landlords Architects' design in size, type, color and placing and with the consent of the Landlord first had and obtained ( with the agreement that such consent shall not be unreasonably withheld) PROVIDED ALWAYS that the Landlord may at the request and cost of the Tenant affix the name and occupation of the Tenant in the frame or frames to be provided by the Landlord at or near the entrance cl the Building or the private enhance or doorway to the Demised Premises or such
                    Other place as the case may be in such manner in each case as shall conform with the permitted of other Tenants (if any ) and as shall from ( me to time be approved by the Landlord
                </div>
                <div>
                    2.23	Not to permit any open or internal combustion fire to be burned within the Demised Premises without the consent in writing of the Landlord first had and obtained nor without the like consent to bring or permit to be brought or kept in or on the Demised Premises any Inflammable combustible or explosive fluid, material, chemical or substance nor cause nor permit any objectionable odours to permeate from the Demised Premises.
                </div>
                <div>
                    2.24	Not to do nor permit not suffer to be done upon or within the Demised Premises anything which in the opinion of the Landlord may be or become a nuisance or annoyance to or in any way interfere with the quiet user of the other portions of the Building or any adjoining or neighboring premises.
                </div>
                <div>
                    2 25      At the Tenant's own expense to install in the Demised Premises such additional firefighting equipment and appliances as shall be required and approved by the Landlord if in the Landlord's opinion the trade business or occupation of the Tenant is such as for necessitate such additional equipment and appliances over and above that and those supplied by the Landlord
                </div>
                <div>
                    2.26	To perform and observe so for as the same are capable of being performed and observed by the tenant all covenants, agreement and conditions, restrictions stipulations and provisions affecting the Demised Premises and under which the piece of land upon which the Building is erected is held.
                </div>
                <div>
                    2.27	At all times during the continuance of the Term to comply with all Laws, Acts, orders, rules, regulations or by-laws enacted, passed,made or issued by the Government of the said Republic or any County, Municipal  Township,local or other authority in relation to the occupation or conduct of the Demised Premises AND lo obtain all such licenses and to execute or cause to be done or executed all such works and things as under or by virtue of any law, Act, order, rule, regulation or by-law are required to be done and at all times to keep the Landlord indemnifieds iaity in thereof 
                </div>
                <div>
                    2.28	Within seven days of the service thereof to give full particulars to the Landlord of any notice, order or proposals therefor given made or issued under or by virtue of any Law,Act, Order, rule, regulation or direction thereunder or under the by-laws of any competent authority and at all times to display and manta to such notices as Ire Landlord may require to be displayed on the Demised Premises.
                </div>
                <div>
                    2.29	To permit the Landlord or its agent or agents a:any time during the Three months next before the expiration of the Term to enter upon the Demised Premises and to permit all persons by order in writing of the Landlord or its agent or agents to view the Demised Premises at reasonable hours in the day time without interruption AND if during the last month of the Term the Tenant shall have removed all  of the Tenant's property from the Demised Premises the Landlord may immediately enter and alter, renovate and redecorate the Demised Premisess
                    without being liable to make any abatement in the rent hereby reserved and without incurring any liability to the Tenant tor any compensation and such acts shall have no effect upon this lease;
                </div>
                <div>
                    2.30	Not to do or permit or suffer to be done any act, matter or thing whereby an encumbrance  may take possession of or a receiver or receiver and manager may be appointed of or a distress or execution be levied or enforced upon or sued out against or analogous proceedings be taken in respect of tire whole or any part of die undertaking, assets or property of the Tenant or whereby the Tenant may be declared by any competent authority or deemed by operation of any law to be insolvent or, in the case of a corporate lessee whereby an order may be made or an effective resolution passed or analogous proceedings be instituted for its 'winding up;
                </div>
                <div>
                    2.31	At the expiration or sooner determination of the Term to yield up the Demised Premises to the Landlord with the fixtures and fittings thereto (other than the other fixtures, partitions and additions installed or erected by the Tenant (aid which are not excepted under clause 2.15 (iii) which said items shall remain the property of the Tenant and the Tenant shall cause the same to be removed on or before the expiry or sooner determination of this ease) in such good and tenantable repair and condition as shall be in accordance with the Tenants covenants and agreements herein contained and with all locks, keys and fastenings complete AND the Tenant s obligation to perform and observe this covenant and agreement shall survive fie expiration or other determination of the Term AND if the last day of the Term shall fell on a Sunday.' Public Holiday this lease shall expire on the business day immediately following PROVIDED ALWAYS that nothing herein contained shad require the Tenant to leave the Demised Premises in any better state or condition of decoration than they were at the commencement of the Term
                </div>
                <div>
                    2.32	To pay all costs in connection with the preparation and completion of this lease and a counterpart thereof together with all stamp duties registration fees and other disbursements but excluding the Landlord s Advocates' costs
                </div>
                <div>
                    2.33	To pay lo the Landlord by way of additional rent a Service Charge, in the amount and in the manner more particularly described in the Third Schedule, being the proportion of the operating expenses of the Building that the floor space of the Premises bears to the floor space of the lettable area of the Building such Service Charge lo be paid with the Rent monthly in advance and shall be in respect of the amount from time to time expended by the Landlord in respect of:
                    <list>
                    <li>
                        i)	the services of such cleaners as the Landlord shall consider necessary' for cleaning and keeping tidy the Common Parts of the Building and the windows therein and the costs of the materials used by such cleaners;
                    </li>
                    <li>
                        ii)	all electricity consumed in the Common Parts of the Building (Common Parts being those parts of the Building enjoyed or used by the Tenant in common 'with others)
                        Including but not limited to the operation and maintenance charges incurred in respect of all electricity or manually operated lighting apparatus lifts and machinery therein,
                    </li>
                    <li>
                        iii)	all water consumed in and all conservancy charges payable in respect of the Common
                        Areas;
                    </li>
                    <li>
                        iv)	all repairs and maintenance not being of a structural nature
                    </li>
                    <li>
                        v)	the costs of managing the Building;
                    </li>
                    <li>
                        vi)	the costs for the upkeep of the Land;
                    </li>
                    <li>
                        vii)	the costs of all insurance policies in respect of the Building;
                    </li>
                    <li>
                        viii)	all rates land rent taxes and other charges of every nature and kind which now or may hereafter be assessed or imposed on the Demised Premises the Land or the Building by the Government or by any local or competent authority,
                    </li>
                    <li>
                        ix)	the services and operating costs of such security staff as the Landlord shall consider
                        necessary for the protection of the exterior of the Building.</li></list>
                    The following provisions shall apply in respect of this Sub-Clause 2.33
                    <list>
                    <li>
                        i)	The Tenant shall pay a deposit on Service Charge equal to 3 months value of the initial
                        Service Charge in accordance with the Fourth Schedule The landlord shall return the said sum to the Tenant upon the expiration of the Term unless the same shall have been applied by the Landlord to any of the Tenant s obligations under this Lease;
                    </li>
                    <li>
                        ii)	The amount of the operating expenses of the Building shall be computed annually for
                        the period ending 30th day of June in each year;
                    </li>
                    <li>
                        iii)	The Tenant shall within Thirty (30) days after the date of written notification from the Landlord or its agent pay the Landlord the amount actually owing in respect of operating expenses as aforesaid in one lump sum in full settlement of the amount of the Service Charge attributed to the Demised Premises in respect of the financial year concerned credit being given lo the Tenant for all the payments made in respect of the same by the Tenant to the Landlord
                    </li>
                    <li>
                        iv)	The amount of the Service Charge shall be ascertained annually by reference to a certificate (hereinafter called the “Certificate ) signed by or on behalf of the auditor engaged by the Landlord as soon as may be practicable after the expiration of each Financial Year and which shall relate lo such Financial Year,
                    </li>
                    <li>
                        v)	The Certificate shall contain a fair summary of the Service Charge as costs and
                        Expenditure during the Financial Year to which it relates:
                    </li>
                    <li>
                        vi)	A copy of the Certificate shall be supplied to the tenant as soon as practicable after it
                        shall have been signed;
                    </li>
                    <li>
                        vii)	In the event that payments made by the tenant and other tenants on account of Service Charge are less than the actual Service Charge expenses of the Landlord the tenant shall within ten (10) days of demand far such additional amount of Service Charge payments required make payment of the tenant's proportionate share of such additional amount of Service Charge payments in such manner as the Landlord shall require
                    </li>
                    <li>
                        viii)	In the event that payments made by the tenant and other tenants on account of Service Charge are more than the actual Service Charge expenses of the Landlord the Landlord may either reimburse the tenant with the proportionate excess amount or give the tenant a credit note for the proportionate excess Service Charge which shall be applied to the immediate Service Charge obligations of the tenant.
                    </li>
                    <li>
                        ix)	Paragraphs (vii) and (viii} shall survive the termination'expiry  of this Lease until the Service Charge accounts between the Landlord and the Tenant are settled.
                    </li>
                    </list>
                </div>
                </p>
            </content>
        </section>
        <section id="s3" onclick="toggle(this)">
            <button class="accordion">Section 3</button>
            <content>
                <p>
                <div>
                    3.	The Tenant to the intent that the obligations hereinafter set out may continue throughout the continuance
                    of the Term hereby further covenants  and agrees with the Landlord that the Tenant-
                </div>
                <div>
                    3.1	Will not use the Demised Premises or any part thereof in such a way as to render the same subject to the provisions of the Factories Act (Chapter 514) or any statutory amendment or re-enactment thereof.
                </div>
                <div>
                    3.2	Will take all necessary steps to prevent any encroachment on the Demised Premises or the acquisition of any new night to light passage, drainage or other elements over, upon or under the Demised Premises and will give notice to the Landlord of any threatened encroachment or attempt to acquire any such easement.
                </div>
                <div>
                    3.3	Will ensure that at all times the Tenant's use of electric current on the Demised Premises shall never exceed the capacity of existing feeders to the Building or of the rises or wiring installations installed in the Building and will adhere to ail other reasonable instructions m this regard which may be issued by the Landlord or its agents from time to time.
                </div>
                
                    3.4	Will not make any alterations or additions to the electrical equipment or appliance installed in the Demised Premises whether by the Landlord or by the Tenant 'without the prior consent of the Landlord in each instance, such consent not to be unreasonably withheld.
                
                <div>
                    3.5	Will give immediate notice to the Landlord in case of fire or accidents or any event that may lead to such fire and accident in the Demised 3remises or o the Building or of defects therein or in any fixtures or equipment therein.
                </div>
                <div>
                    3.6	Will if the Demised Premises shall be or become infested with vermin, at the Tenant' s own expense cause the same to be exterminated from t me to time to the satisfaction of the Landlord AND WILL employ such exterminators as shall be approved by the Landlord,
                </div>
                </p>
            </content>
        </section>
        <section id="s4" onclick="toggle(this)">
            <button class="accordion">Section 4</button>
            <content>
            <p>
            <div>
                4 The Landlord to the extent that the obligations hereinafter set out may continue throughout the continuance of the Term covenants and agrees with the Tenant as follows:-
            </div>
            <div>
                4.1	Unless prevented by any cause beyond its control to procure the adequate lighting of the entrance halls, staircases, landings, passages, lifts, lavatories and washing conveniences in common use by the  Tenant,   the Landlord  and  other  Tenants (if any) during  such  hours  as the  Landlord may reasonably decide and to procure the keeping of the said entrances, halls, staircases landings, passages, lifts, lavatories and washing conveniences and all windows affording light to the same clean and tidy and in good and tenantable repair together with the root , foundations, outside waifs and main structure of the Building PROVIDED ALWAYS that the Landlord shall not be liable for any damage to persons or property caused by or resulting from or arising out of the default of any tenants of the Building or any portion thereof, their servants or agents or licensees with reference to the maintenance or user of any pipes or sanitary water Or electrical apparatus therein or caused by any such persons permitting the maximum floor stress of any cart of the Building or the permitted maximum total weight in any lift therein to be exceeded
            </div>
            <div>
                4.2	To repair and keep the main structure of the building and external areas including the roof in good
                state of repair and maintenance during the continuance of the Term.
            </div>
            <div>
                4 3  To pay all rates, taxes, rent to Government (if any ),  dues and other outgoings that are payable in
                respect of the property.
            </div>
            <div>
                4,4  To procure the payment of the head rent and the Site Value Tax in respect of the Building to the
                applicable authorities if and when the same fall due.
            </div>
            <div>
                4 .5  To procure the keeping of the mam structure of the Building insured against loss or damage by fire, lighting,explosion, aircraft and other aerial devices or articles dropped therefrom, impact, riot, strike, malicious damage and earthquake and/or such other risks as the Landlord may consider appropriate and to procure the rebuilding or reinstating of the Demised Premises and the entrance, halls, staircases, landings, passages and lifts giving access to the Demised Premises so far as the same may be destroyed or damaged but without prejudice to the Tenant’s liability to pay or contribute towards the costs thereof in the event of the insurance money being wholly or partially irrecoverable by reason of any act or default of the Tenant or (he servant or licensees of the Tenant
            </div>
            <div>
                4,6 Subject as is hereinafter otherwise provided in the event of the Demised Premises being damaged or destroyed by fire or other cause and if the policy or policies of insurance effected by the Landlord shall not have been vitiated or payment of the policy moneys refused in whole or in part as a consequence of any act of default of the Tenant or of any servant , employee, agent licensee or visitor of the Tenant, to procure the reinstating or rebuilding of the same or (as the case may require) so much or the Building as may be necessary so dial the Demised Premises shall be as commodious and convenient in all respects as they were before such damage or destruction but not necessarily identical with the accommodation previously existing with all convenient speed PROVIDED ALWAYS that if the Demised Premises are totally damaged or are rendered wholly untenantable by fire or other cause and if the Landlord shall decide no! to restore reinstate or rebuild the same or it the Building shall be so damaged that the Landlord shall decide to demolish it or to rebuild it then and in any case,
                the Landlord may within Ninety (90) days after such fire or other cause give to the Tenant notice in writing in the manner hereinafter provided for the giving of notices of such the Landlord's decision and thereupon the Term shall be determined by lapse of time upon the Seventh day after such notice is given  and the Tenant shall forthwith vacate the Demised Premises and deliver up the same to the Landlord and provided that the Tenant is not in default under this lease then but not otherwise the Tenant’s liability for rent shall cease as from the day following the occurrence of such fire or other cause and PROVIDED ALSO that if the damage or destruction snail have been due to the default neglect of the Tenant then and in such case the Tenant shall remove all debris at the Tenant’s sole cost and expense.
            </div>
            <div>
                4.7 To procure the employment/maintenance of and such staff as may be necessary for the security of the Building and the Demised Premises and the carrying out of the obligations on the part of the Landlord referred to in sub-clause (a) of this clause
            </div>
            <div>
                4.8 That the Tenant paying the rent hereby reserved and any additional rent winch may be payable hereunder and performing and observing the several covenants, agreements, conditions, restrictions stipulations and provisions herein contained or implied and on the part of the Tenant to be performed and observed shall subject as is hereinbefore provided be entitled peaceably to hold and enjoy the Demised Premises during the continuance of the Term without any interruption from or by the
                Landlord or any person rightfully claiming from or under the Landlord.
            </div>
        </p>
        </content>
    </section>
        <section id="s5" onclick="toggle(this)">
        <button class="accordion">Section 5</button>
        <content>
        <p>
        <div>
        5.1 In the event of the Demised Premises or any part thereof being damaged or destroyed by fire or other cause during the continuance of the Term so as to render them unfit for occupation the Landlord will unless such damage or destruction shall have been due to the act or neglect of the Tenant or any servant employee agent or licensee or visitor the Tenant allow to the Tenant a total or proportionate abatement of the rent hereby reserved as the case may be but so that the Tenant shall only have a right of determination of the lease if such damage or default shall not have been due to any such act or neglect as aforesaid and if the Demised Premises or any pad thereof shall have suffered such destruction or substantial damage as cannot reasonably be expected to be repaired within six calendar months PROVIDED ALWAYS that if any dispute under the sub-clause shall arise between the parties hereto the matter shall be referred to an arbitrator to be appointed by the Chairman for the time being of the Chartered Institute of Arbitrators Kenya Chapter , whose award shall be final and binding upon the parties hereto and such reference shall be deemed to be an arbitration within the meaning of - the Arbitration Act (Chapter 49) or any Acts amending or replacing the same.
        </div>
        <div>
        5.2 If the said rent or any other payment due hereunder by the Tenant or any part thereof shall be in arrears for the space of Thirty (30) days next after any of the days whereon the same ought to be paid as aforesaid whether the same shall have been legally demanded or not, or if die Demised Premises become vacant or deserted or if there shall be any breach or non-performance or non-observance by the Tenant of any of the covenants, agreements, conditions, restrictions, stipulations and provisions herein contained and on the part of the Tenants to be performed and observed or if the Tenant for the time being shall be a company and shall enter into liquidation whether compulsory or  voluntary  (not  being  a  voluntary  liquidation  merely  for  the  purpose  of  reconstruction  or amalgamation) or if the Tenant for the hire being shall be a person or persons and shall commit any act of Bankruptcy or be adjudged Bankrupt or enter into any agreement or make any arrangements with or for the benefit of his. her or their creditors for the liquidation of his her or their  debts by composition or otherwise then and in any such case it shall and may be lawful for the Landlord at any lime thereafter to enter into and upon the Demised Premises or any part thereof in the name of the whole and the same to have again repossess and enjoy as in its former state anything herein contained to the contrary notwithstanding without prejudice to any night of action or remedy of the Landlord in respect of any antecedent breach of any of the covenants and agreements by the Tenant hereinbefore contained AND the Tenant hereby waives any right to notice of re-entry or forfeiture under any law for the lime being in force.
        </div>
        <div>
        5.3 No liability shall attach in respect of any breach of any positive covenant or agreement ( other than covenants and agreements for the payment of money) on the part of the Landlord or the Tenant herein contained or implied so long as they shall be prevented from performing the same by statutory restrictions except that if such breach shall occur as aforesaid the Landlord or die Tenant as the case may be shall remedy such bread immediately conditions permit and in the event of any such breach of a covenant or agreement on the part of the Tenant not having been remedied before the expiration or sooner determination of the Term the Tenant shall forthwith upon such expiration or sooner determination pay to the Landlord such an amount as shall be necessary to remedy such breach as aforesaid;
        </div>
        <div>
        5.4 This lease is subject and subordinate to ail ground or underlying leases and to any charges which may now or hereafter affect such leases or the Demised Premises of which the Demised Premises form part and to all renewals, modifications, consolidation, replacements and extensions thereof;
        </div>
        <div>
        5.5 If the Tenant shall default in the performance or observance of any of the covenants agreement conditions stipulations and provisions herein contained or implied and on the Tenant's part to he performed or observed the Landlord may after giving the Tenant Fourteen (14) days, notice perform the same for the account of the Tenant and if the Landlord shall make any expenditure or incur any obligations for the payment of money in connection therewith including but not limited to advocates' fees in instituting prosecuting or defending any action or proceeding such sums paid or obligations incurred with interest and costs shall be deemed to be additional rent hereunder and shall be paid by the Tenant to the Landlord -within Thirty (30) days of the furnishing or rendering to the Tenant of any bill or statement therefor;
        </div>
        <div>
        5.6 The failure of the Landlord to seek redress for violation of or to insist upon the strict performance of any covenant agreement condition restriction stipulation or provision of this tease or any of the rules and regulations from time to time promulgated by the Landlord shall not prevent any subsequent act which would have originally constituted a violation from having all the force and effect of an original violation AND the receipt by the Landlord of any rent with the knowledge of the breach of any covenant agreement condition restriction stipulation or provision of this lease shall not be deemed to be a waiver of such breach NOR shall the failure of the Landlord to enforce any such rule or regulation as aforesaid against the Tenant be deemed to be a waiver of any such rules or regulations unless such waver be expressly made by the Landlord in writing NOR shall any payment by the Tenant or any receipt by the Landlord of a lesser amount than the monthly rent hereby served be deemed to be other than on account of the earliest simulated rent nor shall any endorsement or statement on any cheque or any letter accompanying any cheque or payment as rent be deemed to be an accord and satisfaction and the Landlord may accept any such cheque or payment without prejudice to the Landlord's right to recover the balance of such rent or pursue any other remedy in this lease provided;
        </div>
        <div>
        5.7 No provision contained in this lease shall be waived or varied by either party hereto except by agreement in writing which agreement shall if the case so requires be duly registered in the relevant Lands Registry ;
        </div>
        <div>
        5.8 No delay by the Landlord in exercising any of its right hereunder shall be deemed to be in any way a waiver of such rights
        </div>
        </content>
        </section>
        <section id="s6" onclick="toggle(this)">
            <button class="accordion">Section 6</button>
                <content>
        <p>
        <div>
            6.	The Landlord shall hold the deposit reserved in clause 2.1 above to the credit of the Tenant's account (without payment of interest thereon) upon the following terms and conditions:
        </div>
        <list>
        <li>
            (i)	The Landlord shall return the said sum to the Tenant upon the expiration of the term subject as hereinafter provided.
        </li>
        <li>
            (ii)	PROVIDED ALWAYS that in the event that the Tenant shall make default in paying any instalment of rent as hereinbefore provided or shall commit any breach of any of the covenants conditions and previsions herein contained and on the pad of the Tenant to he performed and observed resulting in any loss damage or expenses to the Landlord then such sum as aforesaid or so much thereof as nary be necessary may be applied by the Landlord in making good any such loss, default or damage or expense but without prejudice to any right of action or remedy of the Landlord against the Tenant in respect of such non-payment or breach on the part of the Tenant
        </li>
    </content>
        </section>
        <section id="s7" onclick="toggle(this)">
            <button class="accordion">Section 7</button>
            <content>
            <p>
        7 Either party may terminate this lease for reason of breach or default in the performance or observance of any of the covenants, agreements, conditions, restrictions, stipulations and provisions herein contained or implied and on the part of the other party to be performed;such breach continuing un-remedied despite due notice having been given,  subject to the party seeking such determination giving the other at least twelve (12 } calendar months’ notice in writing of his/her intention so to do and the Tenant shall at all times down to the  time  of  such  determination  pay  the  rent  and perform  and  observe all  the covenants, agreements, conditions, restrictions,  stipulations and provisions herein contained and on the part of the Tenant to he performed and observed and shall pay all costs properly incurred by the Landlord in effecting completion, stamping and registration of a f ormal surrender of this Lease.
    </p>
            </content>
</section>
        <section id="s8" onclick="toggle(this)">
            <button class="accordion">Section 8</button>
            <content>
            <p>
        8. if the Tenant shall des re to obtain a further lease of the Premises for a further new term lo be agreed upon by the Parties from the expiry of the Term hereby created, the Tenant shall deliver to the Landlord a whiten notice of such desire Three (3) calendar months at least before the expiry of the  Term and provided there shall not at the time of such request be any existing breach or non-observance of any of the covenants agreements conditions and provisions herein contained or implied and on the part of the Tenant lo be observed or performed then subject as hereinafter provided the Landlord shall grant to Use Tenant a Lease of the Premises for a further term as shall be agreed upon by die Parties from the expiration of the term hereby created escaping the present covenant for renewal at a fair market rent which shall be mutually agreed by the parties thereof within the period of One (1) calendar month tom the receipt by the Landlord of the Tenants notice to renew this Lease and in default of such mutual  agreement at such rent as shall be assessed before the expiry of the Term hereby created by an  independent value agreed upon by the Landlord and the Tenant as the then current rental value of the premises.
    </p>
            </content>
</section>
        <section id="s9" onclick="toggle(this)">
            <button class="accordion">Section 9</button>
            <content>
            <p>
        9 Any notice under this Lease shall be in writing and any notice to the Tenant shall be sufficiently served if addressed to the Tenant and delivered to the Premises or sent by registered post to the address given above or to the Tenant's last known address in  Kenya and any notice to the Landlord shall be sufficiency served if served on any agent authorised by the landlord to receive or who has in fact or their behalf collected the rent of the Premises.   Any notice served by registered post shall he deemed to have been served within seven (7 ) days following the day on 'which it is posted.
    </p>
            </content>
</section>
        <section id="s10" onclick="toggle(this)">
            <button class="accordion">Section 10</button>
            <content>
            <p>
        10.	The  Tenant  hereby  agrees  to  accept  this Lease subject  to  the covenants  agreements  restrictions simulations and provisions above set forth or referred to.
        THE SCHEDULES HEREINBEFOREREFERRED TO:
        THE FIRST SCHEDULE: THE PREMISES
        Al that floor space comprising by measurement 2,916 [Two Thousand. Nine Hundred and Sixteen) square feet or thereabouts of  lettable space on die first floor and ground floor of the Building together with the use of common areas in the Building inclusive of the rear yard which premises are shaded and marked an the Plan of the Building registered in the Registry of Documents in Volume Folio File edged and marked red (a copy of which Plan is annexed to this Lease),
        THE SECOND SCHEDULE: THE TERM
        The Term of Six (6) years from the First day of August Two Thousand and Seventeen (now past)
        THE THIRD SCHEDULE: THE RENT
        The monthly gross rent calculated at the rate of Kshs 50/= per square foot translation to a total monthly rent of Kenya Shillings One Hundred and Forty Five Thousand and Eight Hundred (Kshs 145,800) (exclusive of
        VAT) payable quarterly in advance, it being agreed that such Rent shall be increased at the rate of Ten
        [10%) per cent after every two years of the Term.
        The Tenant shall pay Service Charge at the monthly rate of Kenya Shillings One Thousand Five Hundred:
        (Kshs. 1.500) payable quarterly in advance together with the Rent.
        THE FOURTH SCHEDULE: THE DEPOSIT
        The deposit payable by the Tenant shall be equivalent to three months' rent for the Iasi quarter of the term being Kenya Shillings Five Hundred and Twenty Mine Thousand Two Hundred and Fifty Four, (Kshs, 523,254}, The deposit shall  be held by the Landlord pursuant to clause 6 of this lease.
        Deposit for Service Charge shall be equivalent to three months' service charge for the first quarter of the term i.e. Kenya Shillings Four Thousand. Five Hundred [Kshs, 4,500) which shall be held by the Landlord pursuant to clause 2.33 of this Lease
        IN  WITNESS  WHEREOF  this  Lease has been  duly executes  by  the  parties  hereto  the  date and  year first
        hereinbefore written
        SEALED with the common seat of
        THE LANDLORD in the presence of
        Director
        Director/Secretary
        I  CERTIFY that   the above named	.	a   Director  and
        a Director'Secretary of the Landlord appeared before me on the
        day of 	201 and (being Known to me ) acknowledged the above signatures or mark to be theirs and that they had freely and voluntarily executed this instrument ad understood its contents
        Advocate's signature
        SIGNED by	1
        the duty authorised Attorney of the	]
        TENANT by virtue of P.A No . . .	J
        In the presence of:	J
        ADVOCATE	I
        I CERTIFY that		a duly constituted Attorney of the above named Tenant appeared before me on the	. . . day of		201 and (being known to me ) acknowledged the above signature or mark to be theirs and that they had freely and voluntarily executed this
        Instrument ad understock it’s contend.
        Advocate’s signature                                   
    </p>
            </content>
</section>
</body>
</html>