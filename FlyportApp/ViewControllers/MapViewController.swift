//
//  MapViewController.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-03-02.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import GoogleMaps

public class MapViewController: UIViewController, CLLocationManagerDelegate {
	let viewModel: MapViewModel
	private lazy var arrowBack: UIImageView = self.initArrowBack()
	private lazy var titleLabel: UILabel = self.initTitle(text: self.viewModel.title)
	private lazy var tableNumberLabel: UILabel = self.initTableNumberTitle(title: self.viewModel.number)
	private lazy var mapview: GMSMapView = self.initMapView()
	fileprivate let locationManager: CLLocationManager = CLLocationManager()
	
	public init(viewModel: MapViewModel) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public override func viewDidLoad() {
		super.viewDidLoad()
		self.tabBarController?.tabBar.isHidden = true
		self.navigationController?.navigationBar.isHidden = true
		self.view.backgroundColor = UIColor(named: "ButtonColor")
		
		self.view.addSubview(self.arrowBack)
		self.activateArrowBackConstraints()
		self.view.addSubview(self.titleLabel)
		self.activateTitleLabelConstraints()
		self.view.addSubview(self.tableNumberLabel)
		self.activateTableNumberLabelConstraints()
		self.view.addSubview(self.mapview)
		self.activateMapConstraints()
		self.checkLocationServices()
		self.drawRoute()
	}
	
	@objc private func returnToPreviousScreen() {
		self.navigationController?.popViewController(animated: true)
	}
}

extension MapViewController {
	private func initArrowBack() -> UIImageView {
		let image = #imageLiteral(resourceName: "returnArrow").withRenderingMode(.alwaysTemplate)
		let imageView = UIImageView(image: image)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleToFill
		imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
		imageView.tintColor = .white
		imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(returnToPreviousScreen)))
		imageView.isUserInteractionEnabled = true
		return imageView
	}
	
	private func initTitle(text: String) -> UILabel {
		let label = UILabel()
		label.text = text
		label.font = UIFont(name: "Sora-Medium", size: UIView.margin(of: [14.0, 18.0, 20.0]))
		label.font = label.font.withSize(UIView.margin(of: [14.0, 18.0, 20.0]))
		label.textColor = .white
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		return label
	}
	
	private func initTableNumberTitle(title: String) -> UILabel {
		let label = UILabel()
		label.text = title
		label.font = UIFont(name: "Sora-Medium", size: UIView.margin(of: [30.0, 40.0, 40.0]))
		label.font = label.font.withSize(UIView.margin(of: [30.0, 40.0, 40.0]))
		label.textColor = .white
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		return label
	}
	
	private func initMapView() -> GMSMapView {
		let camera = GMSCameraPosition.camera(withLatitude: -20, longitude: 20, zoom: 50.0)
		let mapView = GMSMapView(frame: CGRect(x: 50, y: 50, width: 50, height: 50), camera: camera)
		mapView.translatesAutoresizingMaskIntoConstraints = false
		return mapView
	}
}

extension MapViewController {
	private func activateArrowBackConstraints() {
		NSLayoutConstraint.activate([
			self.arrowBack.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10.0),
			self.arrowBack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [14, 16, 18])),
			self.arrowBack.heightAnchor.constraint(equalToConstant: UIView.margin(of: [22.0, 29.0, 36.0])),
			self.arrowBack.widthAnchor.constraint(equalToConstant: UIView.margin(of: [22.0, 29.0, 36.0]))
		])
	}
	
	private func activateTitleLabelConstraints() {
		NSLayoutConstraint.activate([
			self.titleLabel.topAnchor.constraint(equalTo: self.arrowBack.bottomAnchor, constant: 7.0),
			self.titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [14, 16, 18])),
			self.titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [14, 16, 18]))
		])
	}
	
	private func activateTableNumberLabelConstraints() {
		NSLayoutConstraint.activate([
			self.tableNumberLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: UIView.margin(of: [11, 14, 17])),
			self.tableNumberLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: UIView.margin(of: [14, 16, 18])),
			self.tableNumberLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -UIView.margin(of: [14, 16, 18])),
			self.tableNumberLabel.heightAnchor.constraint(equalToConstant: UIView.margin(of: [55, 70, 80]))
		])
	}
	
	private func activateMapConstraints() {
		NSLayoutConstraint.activate([
			self.mapview.topAnchor.constraint(equalTo: self.tableNumberLabel.bottomAnchor, constant: UIView.margin(of: [23, 30, 30])),
			self.mapview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
			self.mapview.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
			self.mapview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
		])
	}
	
	public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		if let location = locations.last{
			self.locationManager.startUpdatingLocation()
			let camera = GMSCameraPosition.camera(withLatitude: (location.coordinate.latitude), longitude: (location.coordinate.longitude), zoom: 17.0)
			self.mapview.animate(to: camera)
			self.mapview.setMinZoom(20, maxZoom: 30)
			self.locationManager.stopUpdatingLocation()
		}
	}
	
	func checkLocationAuthorization() {
		switch CLLocationManager.authorizationStatus() {
		case .authorizedWhenInUse:
			self.mapview.isMyLocationEnabled = true
			locationManager.startUpdatingLocation()
			break
		case .denied:
			break
		case .notDetermined:
			locationManager.requestWhenInUseAuthorization()
		case .restricted:
			break
		case .authorizedAlways:
			break
		@unknown default:
			fatalError()
		}
	}
	
	func checkLocationServices() {
		if CLLocationManager.locationServicesEnabled() {
			setupLocationManager()
			checkLocationAuthorization()
		}
	}
	
	public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
		checkLocationAuthorization()
	}
	
	func setupLocationManager() {
		locationManager.delegate = self
	}
	
	private func drawRoute() {
		let path = GMSMutablePath()
		self.viewModel.coordinates.forEach {
			path.add($0)
		}
		let pathLine = GMSPolyline(path: path)
		pathLine.strokeWidth = 5.0
		pathLine.strokeColor = UIColor(named: "ButtonColor")!
		pathLine.map = self.mapview
		if let lastCoordinate = self.viewModel.coordinates.last {
			let mapMarker = GMSMarker(position: lastCoordinate)
			let markerImage = UIImage(named: "airportPin")!
			mapMarker.icon = self.image(markerImage, scaledToSize: CGSize(width: 50, height: 50))
			mapMarker.title = self.viewModel.destinationTitle
			mapMarker.map = self.mapview
		}
	}
	
		fileprivate func image(_ originalImage:UIImage, scaledToSize:CGSize) -> UIImage {
			if originalImage.size.equalTo(scaledToSize) {
				return originalImage
			}
			UIGraphicsBeginImageContextWithOptions(scaledToSize, false, 0.0)
			originalImage.draw(in: CGRect(x: 0, y: 0, width: scaledToSize.width, height: scaledToSize.height))
			let image = UIGraphicsGetImageFromCurrentImageContext()
			UIGraphicsEndImageContext()
			return image!
		}
}
