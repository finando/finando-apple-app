import SwiftUI
import Charts

struct LineChartNSViewRepresentable: NSViewRepresentable {
    let entries: [ChartDataEntry]
    let minY: Double?
    let maxY: Double?

    func makeNSView(context: Context) -> LineChartView {
        return LineChartView()
    }

    func updateNSView(_ nsView: LineChartView, context: Context) {
        let dataSet = LineChartDataSet(entries: entries, label: "Something")

        nsView.data = LineChartData(dataSet: dataSet)
        nsView.legend.enabled = false
        nsView.backgroundColor = NSUIColor(Theme.color.neutral.n0.color)
        nsView.scaleXEnabled = false
        nsView.scaleYEnabled = false
        nsView.dragEnabled = false
//        nsView.borderColor = .green
//        nsView.borderLineWidth = 2
//        nsView.drawGridBackgroundEnabled = true
//        nsView.leftAxis.drawGridLinesEnabled = false
//        nsView.leftAxis.enabled = false
//        nsView.leftAxis.labelTextColor = .black
//        nsView.marker = MarkerView()
        nsView.drawMarkers = true
        

        formatXAxis(xAxis: nsView.xAxis)
        formatLeftAxis(leftAxis: nsView.leftAxis)
        formatRightAxis(rightAxis: nsView.rightAxis)
        
        formatDataSet(dataSet: dataSet)

        nsView.notifyDataSetChanged()
    }

    private func formatXAxis(xAxis: XAxis) -> Void {
        xAxis.labelTextColor = NSUIColor(Theme.color.neutral.n60.color)
        xAxis.labelPosition = .bottom
        xAxis.drawGridLinesEnabled = false
        xAxis.valueFormatter = DateAxisValueFormatter()
        xAxis.avoidFirstLastClippingEnabled = true
//        xAxis.labelCount = 5
//        entries.map { $0.x }
//        xAxis.valueFormatter = IndexAxisValueFormatter(values: <#T##[String]#>)
    }

    private func formatLeftAxis(leftAxis: YAxis) -> Void {
        leftAxis.labelTextColor = NSUIColor(Theme.color.neutral.n60.color)
//        leftAxis.drawTopYLabelEntryEnabled = true
//        leftAxis.inverted = true
        leftAxis.drawGridLinesEnabled = true
        leftAxis.gridLineDashLengths = [10]
        leftAxis.gridColor = NSUIColor(Theme.color.neutral.n30.color)
        leftAxis.drawLimitLinesBehindDataEnabled = true
        leftAxis.labelCount = 10
//        leftAxis.sp
//        leftAxis.labelXOffset = -20

        if let axisMinimum = minY {
            leftAxis.axisMinimum = axisMinimum
        }

        if let axisMaximum = maxY {
            leftAxis.axisMaximum = axisMaximum
            
            let limitLine = ChartLimitLine(limit: axisMaximum)
            
            limitLine.lineWidth = 3
            limitLine.lineDashLengths = [10]
            limitLine.lineColor = NSUIColor(Theme.color.red.r50.color)

            leftAxis.addLimitLine(limitLine)
        }
        
        let currencyFormatter = CurrencyUtils.getCurrencyFormatter(decimalPlaces: 0)
        leftAxis.valueFormatter = DefaultAxisValueFormatter(formatter: currencyFormatter)
    }

    private func formatRightAxis(rightAxis: YAxis) -> Void {
        rightAxis.enabled = false
    }

    private func formatDataSet(dataSet: LineChartDataSet) {
        dataSet.colors = [NSUIColor(Theme.color.blue.b50.color)]
        dataSet.drawCirclesEnabled = false
//        dataSet.drawCircleHoleEnabled = false
//        dataSet.circleHoleColor = .green
//        dataSet.circleColors = [.red]
//        dataSet.circleRadius = 3
        dataSet.lineWidth = 3
        dataSet.mode = .stepped
        dataSet.drawFilledEnabled = true
        dataSet.fillColor = NSUIColor(Theme.color.blue.b40.color)
        dataSet.fillAlpha = 0.2
//        dataSet.drawIconsEnabled = true
        dataSet.drawValuesEnabled = false
    }

    private class DateAxisValueFormatter: IAxisValueFormatter {
        func stringForValue(_ value: Double, axis: AxisBase?) -> String {
            return Date(timeIntervalSince1970: value as TimeInterval).formatted(format: "dd MMM yyy")
        }
    }
}

struct LineChartNSViewRepresentable_Previews: PreviewProvider {
    static var previews: some View {
        LineChartNSViewRepresentable(
            entries: [
                ChartDataEntry(x: 0.0, y: 0.0),
                ChartDataEntry(x: 10.0, y: 5.0),
                ChartDataEntry(x: 20.0, y: 25.0),
                ChartDataEntry(x: 30.0, y: 30.0)
            ],
            minY: 0.0,
            maxY: 30.0
        )
    }
}



//struct LineChart: UIViewRepresentable {
//    // NOTE: No Coordinator or delegate functions in this example
//    let lineChart = LineChartView()
//    var entriesIn : [ChartDataEntry] // there is no LineChartDataEntry as I would have expected
//    var entriesOut: [ChartDataEntry]
//    func makeUIView(context: Context) -> LineChartView {
//        return lineChart
//    }
//
//    func updateUIView(_ uiView: LineChartView, context: Context) {
//        setChartData(uiView)
//        configureChart(uiView)
//        formatXAxis(xAxis: uiView.xAxis)
//        formatLeftAxis(leftAxis: uiView.leftAxis)
//        formatLegend(legend: uiView.legend)
//        uiView.notifyDataSetChanged()
//    }
//
//    func setChartData(_ lineChart: LineChartView) {
//        let dataSetIn = LineChartDataSet(entries: entriesIn)
//        let dataSetOut = LineChartDataSet(entries: entriesOut)
//        let dataSets: [LineChartDataSet] = [dataSetIn, dataSetOut]
//        let lineChartData = LineChartData(dataSets: dataSets)
//        lineChart.data = lineChartData
//        formatDataSet(dataSet: dataSetIn, label: "Wine In", color: .red)
//        formatDataSet(dataSet: dataSetOut, label: "Wine out", color: .blue)
//    }
//
//    func formatDataSet(dataSet: LineChartDataSet, label: String, color: UIColor) {
//        dataSet.label = label
//        dataSet.colors = [color]
//        dataSet.valueColors = [color]
//        dataSet.circleColors = [color]
//        dataSet.circleRadius = 4
//        dataSet.circleHoleRadius = 0
//        dataSet.mode = .horizontalBezier
//        dataSet.lineWidth = 4
//        dataSet.lineDashLengths = [4]
//        let format = NumberFormatter()
//        format.numberStyle = .none
//        dataSet.valueFormatter = DefaultValueFormatter(formatter: format)
//        dataSet.valueFont = UIFont.systemFont(ofSize: 12)
//    }
//
//    func configureChart(_ lineChart: LineChartView) {
//        lineChart.noDataText = "No Data"
//        lineChart.drawGridBackgroundEnabled = true
//        lineChart.gridBackgroundColor = UIColor.tertiarySystemFill
//        lineChart.drawBordersEnabled = true
//        lineChart.rightAxis.enabled = false
//        lineChart.setScaleEnabled(false)
//        if lineChart.scaleX == 1.0 {
//            lineChart.zoom(scaleX: 1.5, scaleY: 1, x: 0, y: 0)
//        }
//            lineChart.animate(xAxisDuration: 0, yAxisDuration: 0.5, easingOption: .linear)
//        let marker:BalloonMarker = BalloonMarker(color: UIColor.red, font: UIFont(name: "Helvetica", size: 12)!, textColor: UIColor.white, insets: UIEdgeInsets(top: 7.0, left: 7.0, bottom: 7.0, right: 7.0))
//        marker.minimumSize = CGSize(width: 75, height: 35)
//        lineChart.marker = marker
//    }
//
//    func formatXAxis(xAxis: XAxis) {
//        xAxis.labelPosition = .bottom
//        xAxis.valueFormatter = IndexAxisValueFormatter(values:Transaction.monthArray)
//        xAxis.labelTextColor =  .red
//        xAxis.labelFont = UIFont.boldSystemFont(ofSize: 12)
//        // Setting the max and min make sure that the markers are visible at the edges
//        xAxis.axisMaximum = 12
//        xAxis.axisMinimum = -1
//    }
//
//    func formatLeftAxis(leftAxis:YAxis) {
//        let leftAxisFormatter = NumberFormatter()
//        leftAxisFormatter.numberStyle = .none
//        leftAxis.valueFormatter = DefaultAxisValueFormatter(formatter: leftAxisFormatter)
//        leftAxis.labelTextColor =  .red
//        leftAxis.labelFont = UIFont.boldSystemFont(ofSize: 12)
//    }
//
//    func formatLegend(legend: Legend) {
//        legend.textColor = UIColor.red
//        legend.horizontalAlignment = .right
//        legend.verticalAlignment = .top
//        legend.drawInside = true
//        legend.yOffset = 20.0
//    }
//}
//
//
//struct LineChart_Previews: PreviewProvider {
//    static var previews: some View {
//        LineChart(
//            entriesIn: Transaction.lineChartDataForYear(2019, transactions: Transaction.allTransactions, itemType: .itemIn),
//            entriesOut: Transaction.lineChartDataForYear(2019, transactions: Transaction.allTransactions, itemType: .itemOut))
//            .frame(height: 400)
//            .padding(.horizontal)
//    }
//}
