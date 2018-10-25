//
//  NewProjectViewController.swift
//  mmstudio
//
//  Created by VANSA PHA on 10/23/18.
//  Copyright © 2018 Vansa Pha. All rights reserved.
//

import UIKit
import MIDITimeTableView

class NewProjectViewController: UIViewController {

    @IBOutlet weak var timeTableView: MIDITimeTableView!
    @IBOutlet weak var undoButton: UIBarButtonItem!
    @IBOutlet weak var redoButton: UIBarButtonItem!
    
    var rowData: [MIDITimeTableRowData] = [
        MIDITimeTableRowData(
            cells: [
                MIDITimeTableCellData(data: "C7", position: 0, duration: 4),
                MIDITimeTableCellData(data: "Dm7", position: 4, duration: 4),
                MIDITimeTableCellData(data: "G7b5", position: 8, duration: 4),
                MIDITimeTableCellData(data: "C7", position: 12, duration: 4),
                ],
            headerCellView: HeaderCellView(title: "Chords"),
            cellView: { cellData in
                let title = cellData.data as? String ?? ""
                return CellView(title: title)
        }),
        
        MIDITimeTableRowData(
            cells: [
                MIDITimeTableCellData(data: "C", position: 0, duration: 1),
                MIDITimeTableCellData(data: "D", position: 4, duration: 1),
                MIDITimeTableCellData(data: "G", position: 8, duration: 1),
                MIDITimeTableCellData(data: "C", position: 12, duration: 1),
                ],
            headerCellView: HeaderCellView(title: "Bass"),
            cellView: { cellData in
                let title = cellData.data as? String ?? ""
                return CellView(title: title)
        }),
        
        MIDITimeTableRowData(
            cells: [
                MIDITimeTableCellData(data: "C", position: 0, duration: 1),
                MIDITimeTableCellData(data: "C", position: 1, duration: 1),
                MIDITimeTableCellData(data: "C", position: 2, duration: 1),
                MIDITimeTableCellData(data: "C", position: 3, duration: 1),
                
                MIDITimeTableCellData(data: "D", position: 4, duration: 1),
                MIDITimeTableCellData(data: "D", position: 5, duration: 1),
                MIDITimeTableCellData(data: "D", position: 6, duration: 1),
                MIDITimeTableCellData(data: "D", position: 7, duration: 1),
                
                MIDITimeTableCellData(data: "G", position: 8, duration: 1),
                MIDITimeTableCellData(data: "G", position: 9, duration: 1),
                MIDITimeTableCellData(data: "G", position: 10, duration: 1),
                MIDITimeTableCellData(data: "G", position: 11, duration: 1),
                
                MIDITimeTableCellData(data: "C", position: 12, duration: 1),
                MIDITimeTableCellData(data: "C", position: 13, duration: 1),
                MIDITimeTableCellData(data: "C", position: 14, duration: 1),
                MIDITimeTableCellData(data: "C", position: 15, duration: 1),
                ],
            headerCellView: HeaderCellView(title: "Melody"),
            cellView: { cellData in
                let title = cellData.data as? String ?? ""
                return CellView(title: title)
        }),
        
        MIDITimeTableRowData(
            cells: [
                MIDITimeTableCellData(data: "C", position: 0, duration: 0.5),
                MIDITimeTableCellData(data: "C", position: 2, duration: 0.5),
                
                MIDITimeTableCellData(data: "D", position: 4, duration: 0.5),
                MIDITimeTableCellData(data: "D", position: 6, duration: 0.5),
                
                MIDITimeTableCellData(data: "G", position: 8, duration: 0.5),
                MIDITimeTableCellData(data: "G", position: 10, duration: 0.5),
                
                MIDITimeTableCellData(data: "C", position: 12, duration: 0.5),
                MIDITimeTableCellData(data: "C", position: 14, duration: 0.5),
                ],
            headerCellView: HeaderCellView(title: "Synths"),
            cellView: { cellData in
                let title = cellData.data as? String ?? ""
                return CellView(title: title)
        })
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        timeTableView?.dataSource = self
        timeTableView?.timeTableDelegate = self
        timeTableView?.gridLayer.showsSubbeatLines = false
        timeTableView?.reloadData()
        updateHistoryButtons()
        
        timeTableView?.backgroundColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
        timeTableView?.measureView.backgroundColor = UIColor.gray
        timeTableView?.measureView.tintColor = UIColor.white
        timeTableView?.gridLayer.rowLineColor = .black
        timeTableView?.gridLayer.barLineColor = UIColor.purple
        timeTableView?.gridLayer.beatLineColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        timeTableView?.playheadView.tintColor = UIColor.gray.withAlphaComponent(0.5)
        timeTableView?.rangeheadView.tintColor = UIColor.gray.withAlphaComponent(0.3)
    }
    @IBAction func redoDidPress(_ sender: UIBarButtonItem) {
        timeTableView?.history.redo()
        updateHistoryButtons()
    }
    @IBAction func undoDidPress(_ sender: UIBarButtonItem) {
        timeTableView?.history.undo()
        updateHistoryButtons()
    }
    
    private func updateHistoryButtons() {
        undoButton?.isEnabled = timeTableView?.history.hasPreviousItem ?? false
        redoButton?.isEnabled = timeTableView?.history.hasNextItem ?? false
    }

}

extension NewProjectViewController: MIDITimeTableViewDataSource, MIDITimeTableViewDelegate {
    // MARK: MIDITimeTableViewDataSource
    
    func numberOfRows(in midiTimeTableView: MIDITimeTableView) -> Int {
        return rowData.count
    }
    
    func timeSignature(of midiTimeTableView: MIDITimeTableView) -> MIDITimeTableTimeSignature {
        return MIDITimeTableTimeSignature(beats: 4, noteValue: .quarter)
    }
    
    func midiTimeTableView(_ midiTimeTableView: MIDITimeTableView, rowAt index: Int) -> MIDITimeTableRowData {
        let row = rowData[index]
        return row
    }
    
    // MARK: MIDITimeTableViewDelegate
    
    func midiTimeTableViewHeightForRows(_ midiTimeTableView: MIDITimeTableView) -> CGFloat {
        return 60
    }
    
    func midiTimeTableViewHeightForMeasureView(_ midiTimeTableView: MIDITimeTableView) -> CGFloat {
        return 20
    }
    
    func midiTimeTableViewWidthForRowHeaderCells(_ midiTimeTableView: MIDITimeTableView) -> CGFloat {
        return 100
    }
    
    func midiTimeTableView(_ midiTimeTableView: MIDITimeTableView, didDelete cells: [MIDITimeTableCellIndex]) {
        rowData.removeCells(at: cells)
        timeTableView?.reloadData()
        updateHistoryButtons()
    }
    
    func midiTimeTableView(_ midiTimeTableView: MIDITimeTableView, didEdit cells: [MIDITimeTableViewEditedCellData]) {
        var removingCells = [MIDITimeTableCellIndex]()
        
        for cell in cells {
            // Update edited cell
            rowData[cell.index].duration = cell.newDuration
            rowData[cell.index].position = cell.newPosition
            
            // update cell row
            if cell.index.row != cell.newRowIndex {
                rowData.appendCell(rowData[cell.index], row: cell.newRowIndex)
                removingCells.append(cell.index)
            }
        }
        
        rowData.removeCells(at: removingCells)
        timeTableView?.reloadData()
        updateHistoryButtons()
    }
    
    func midiTimeTableView(_ midiTimeTableView: MIDITimeTableView, didUpdatePlayhead position: Double) {
        return
    }
    
    func midiTimeTableView(_ midiTimeTableView: MIDITimeTableView, didUpdateRangeHead position: Double) {
        return
    }
    
    func midiTimeTableView(_ midiTimeTableView: MIDITimeTableView, historyDidChange history: MIDITimeTableHistory) {
        rowData = history.currentItem
    }
    
}
