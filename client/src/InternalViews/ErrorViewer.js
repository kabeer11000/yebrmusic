import React from "react";
import {useParams} from "react-router-dom";
import {Container, Typography} from "@material-ui/core";
import Button from "@material-ui/core/Button";
import {useQuery} from "../Hooks";
import {Error, ExpandMore} from "@material-ui/icons";
import AccordionSummary from "@material-ui/core/AccordionSummary";
import Accordion from "@material-ui/core/Accordion";
import AccordionDetails from "@material-ui/core/AccordionDetails";

const code2message = (code) => {
    switch (code) {
        case "INVALID_STATE":
            return "An error occurred logging you in, Try Again?"
    }
}

const InvalidState = () => {
    const queryString = useQuery();
    return (
        <Container maxWidth={"md"} className={"text-center"} style={{
            marginTop: "30vh",
            marginBottom: "auto"
        }}>
            <Typography variant="h5">Trouble logging you in, Retry?</Typography>
            <br/>
            <Button className={"mt-2"} variant="contained"
                    onClick={() => window.location.href = decodeURIComponent(queryString.get("redirect_to"))}>Retry</Button>
        </Container>
    )
};
const error2details = (code) => {
    switch (code) {
        case "INVALID_STATE":
            return <div>Invalid state returned from OAuth provider (Kabeer's IDP)</div>;
        default:
            return <div/>
    }
}
const PageContainer = ({children, code}) => {
    return <div>
        <div>{children}</div>
        <div style={{
            bottom: 0,
            position: "fixed"
        }}>
            <Accordion>
                <AccordionSummary
                    expandIcon={<ExpandMore/>}
                    aria-controls="panel1a-content"
                    id="panel1a-header"
                >
                    <Typography><Error/> Error Details</Typography>
                </AccordionSummary>
                <AccordionDetails>
                    <Typography>
                        {error2details(code)}
                    </Typography>
                </AccordionDetails>
            </Accordion>
        </div>
    </div>
}
export const ErrorComponent = () => {
    const {code} = useParams();
    switch (code) {
        case "INVALID_STATE":
            return <PageContainer code={code}>
                <InvalidState/>
            </PageContainer>;
        default:
            return <div/>
    }
}
