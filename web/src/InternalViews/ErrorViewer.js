import React from "react";
import {useParams} from "react-router-dom";
import {Container, Typography} from "@material-ui/core";
import Button from "@material-ui/core/Button";
import {useQuery} from "../Hooks";
import {Error, ExpandMore} from "@material-ui/icons";
import AccordionSummary from "@material-ui/core/AccordionSummary";
import Accordion from "@material-ui/core/Accordion";
import AccordionDetails from "@material-ui/core/AccordionDetails";
import {AbstractFeedbackDialog} from "../components/FeedBack/FeedBack";
import Alert from "@material-ui/lab/Alert";
import Grid from "@material-ui/core/Grid";
import AlertTitle from "@material-ui/lab/AlertTitle";
import Strings from "../Strings";

const code2message = (code) => {
	switch (code) {
		case "INVALID_STATE":
			return "An error occurred logging you in, Try Again?";
		case "APP_ERROR":
			return "";
	}
};

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
	);
};
const AppError = () => {
	const [open, setOpen] = React.useState(false);
	return <div>
		<AbstractFeedbackDialog open={open} onSubmit={() => setOpen(!open)} onClose={() => setOpen(!open)}/>
		<Container maxWidth={"md"} className={"text-center"} style={{
			marginTop: "30vh",
			marginBottom: "auto"
		}}>
			<Typography variant="h5">An internal application error has occurred. retry?</Typography>
			<br/>
			<Button onClick={() => setOpen(!open)}>Report Error</Button>
			<Button variant="contained"
					onClick={() => window.location.reload()}>Retry</Button>
		</Container>
	</div>;
};
export const ConnectionError = () => (
	<Alert severity="error" style={{
		height: "100vh",
		paddingTop: "2rem"
	}}>
		<React.Fragment>
			<Grid container spacing={2}>
				<Grid item xs={12} sm={12} md={12} lg={12} xl={12}>
					<AlertTitle>{Strings["Utils:App:Net.NoConnection:Failed.Title"]}</AlertTitle>
					{Strings["Utils:App:Net.NoConnection:Failed.Body[1]"]}
				</Grid>
				<Grid item xl={6}>
					<Button style={{
						width: "100%"
					}} color="inherit"
							onClick={() => window.location.href = Strings["SupportEmail"]}>{Strings["Utils:App:Support"]}</Button>
				</Grid>
				<Grid item xl={6}>
					<Button variant={"outlined"} style={{
						width: "100%"
					}} color="inherit"
							onClick={() => window.location.reload()}>{Strings["Utils:App:Retry.Text"]}</Button>
				</Grid>
			</Grid>
		</React.Fragment>
	</Alert>
);
const error2details = (code) => {
	switch (code) {
		case "INVALID_STATE":
			return <div>Invalid state returned from OAuth provider (Kabeer's IDP)</div>;
		case "APP_ERROR":
			return <div>An internal error has occurred inside the app.</div>;
		default:
			return <div></div>;
	}
};
const PageContainer = ({children, code}) => {
	return <div>
		<div>{children}</div>
		<div style={{
			bottom: 0,
			position: "fixed"
		}}>
			<Accordion variant={"outlined"} elevation={0}>
				<AccordionSummary
					expandIcon={<ExpandMore/>}
					aria-controls="panel1a-content"
					id="panel1a-header">
					<Typography><Error/> Error Details</Typography>
				</AccordionSummary>
				<AccordionDetails>
					<Typography>
						{error2details(code)}
					</Typography>
				</AccordionDetails>
			</Accordion>
		</div>
	</div>;
};
export const ErrorComponent = () => {
	const {code} = useParams();
	switch (code) {
		case "INVALID_STATE":
			return <PageContainer code={code}>
				<InvalidState/>
			</PageContainer>;
		case "APP_ERROR":
			return <PageContainer code={code}>
				<AppError/>
			</PageContainer>;
		default:
			return "";
	}
};
