//
//  HomeTripsViewController.swift
//  KidsFly
//
//  Created by Alex Shillingford on 9/26/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit
import CoreData

class HomeTripsViewController: UIViewController {

    // MARK: - IBOutlets and properties
    @IBOutlet weak var myTripsTableView: UITableView!
    
    lazy var fetchResultsController: NSFetchedResultsController<Trip> = {
        let fetchRequest: NSFetchRequest<Trip> = Trip.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "tripid", ascending: true)]
        
        let frc = NSFetchedResultsController(fetchRequest: fetchRequest,
                                             managedObjectContext: CoreDataStack.shared.mainContext,
                                             sectionNameKeyPath: "tripid",
                                             cacheName: nil)
        frc.delegate = self
        
        do {
            try frc.performFetch()
        } catch {
            fatalError("Error performing fetch for frc on line \(#line) in \(#file)")
        }
        
        return frc
    }()
    // MARK: Methods and Functions
        override func viewDidLoad() {
            super.viewDidLoad()
            myTripsTableView.delegate = self
            myTripsTableView.dataSource = self
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
        @IBAction func notifyButtonTapped(_ sender: Any) {
        }
}

// MARK: - TableViewDelegate Extension
extension HomeTripsViewController: UITableViewDelegate {
    
}

// MARK: - DataSource Extension
extension HomeTripsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return fetchResultsController.sections?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return fetchResultsController.sections?[section].numberOfObjects ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TripCell", for: indexPath) as? HomeTripsTableViewCell else { return UITableViewCell() }
        let trip = fetchResultsController.object(at: indexPath)
        
        cell.trip = trip
        return cell
    }
}

// MARK: - FRC Delegate
extension HomeTripsViewController: NSFetchedResultsControllerDelegate {
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        myTripsTableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        myTripsTableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>,
                    didChange anObject: Any,
                    at indexPath: IndexPath?,
                    for type: NSFetchedResultsChangeType,
                    newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            guard let newIndexPath = newIndexPath else { return }
            myTripsTableView.insertRows(at: [newIndexPath], with: .automatic)
        case .delete:
            guard let indexPath = indexPath else { return }
            myTripsTableView.deleteRows(at: [indexPath], with: .automatic)
        case .move:
            guard let indexPath = indexPath,
                let newIndexPath = newIndexPath else { return }
            myTripsTableView.moveRow(at: indexPath, to: newIndexPath)
        case .update:
            guard let indexPath = indexPath else { return }
            myTripsTableView.reloadRows(at: [indexPath], with: .automatic)
        @unknown default:
            return
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>,
                    didChange sectionInfo: NSFetchedResultsSectionInfo,
                    atSectionIndex sectionIndex: Int,
                    for type: NSFetchedResultsChangeType) {
        let sectionSet = IndexSet(integer: sectionIndex)
        
        switch type {
        case .insert:
            myTripsTableView.insertSections(sectionSet, with: .automatic)
        case .delete:
            myTripsTableView.deleteSections(sectionSet, with: .automatic)
        default:
            return
        }
    }
}
