import React from "react";

//import "./style.css";

class Rating extends React.PureComponent {
	constructor(props) {
		super(props);
		this.state = {
			rating: this.props.rating || null,
			temp_rating: null
		};
	}

	handleMouseover(rating) {
		this.setState(prev => ({
			rating,
			temp_rating: prev.rating
		}));
	}

	handleMouseout() {
		this.setState(prev => ({
			rating: prev.temp_rating
		}));
	}

	rate(rating) {
		this.setState({
			rating,
			temp_rating: rating
		});
	}

	render() {
		const {rating} = this.state;
		let stars = [];
		for (let i = 0; i < 10; i++) {
			let starClass = "ion-ios-star-outline";
			if (this.state.rating >= i && this.state.rating !== null) {
				starClass = "ion-ios-star";
			}
			stars.push(
				<i
					key={i}
					style={{
						display: "inline-block",
						width: "14px",
						fontSize: "32px",
						overflow: "hidden",
						direction: i % 2 === 0 ? "ltr" : "rtl"
					}}
					className={starClass}
					onMouseOver={() => this.handleMouseover(i)}
					onClick={() => this.rate(i)}
					onMouseOut={() => this.handleMouseout()}
				/>
			);
		}
		return <div>{stars}</div>;
	}
}

export default Rating;
