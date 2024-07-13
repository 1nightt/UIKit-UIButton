import UIKit

/// Экран секундомера
final class StopwatchViewController: UIViewController {
    // MARK: - Constants
    private enum Constants {
        static let backgroundColor: UIColor = .white
    }
    
    private var timer = Timer()
    private var isTimerRunning = false
    private var counter = 0.0
    private var timerLabel = UILabel()
    private var startPauseButton = UIButton(type: .system)
    private var stopButton = UIButton(type: .system)
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.backgroundColor
        setupForLabel()
        setupForStartPauseButton()
        setupForStopButton()
    }
    
    // MARK: - Private Methods
    private func setupForLabel() {
        timerLabel.frame = CGRect(x: 0, y: 250, width: 100, height: 50)
        timerLabel.center.x = view.center.x
        timerLabel.textAlignment = .center
        timerLabel.font = UIFont.systemFont(ofSize: 25)
        timerLabel.text = "0.0"
        view.addSubview(timerLabel)
    }
    
    private func setupForStartPauseButton() {
        startPauseButton.frame = CGRect(x: 0, y: 350, width: 100, height: 50)
        startPauseButton.center.x = view.center.x
        startPauseButton.setTitle("Старт", for: .normal)
        startPauseButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(startPauseButton)
        startPauseButton.addTarget(self, action: #selector(startPauseTapped), for: .touchUpInside)
    }
    
    private func setupForStopButton() {
        stopButton.frame = CGRect(x: 0, y: 420, width: 100, height: 50)
        stopButton.center.x = view.center.x
        stopButton.setTitle("Стоп", for: .normal)
        stopButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(stopButton)
        stopButton.addTarget(self, action: #selector(stopTapped), for: .touchUpInside)
    }
    
    @objc private func startPauseTapped() {
        if isTimerRunning {
            timer.invalidate()
            startPauseButton.setTitle("Старт", for: .normal)
        } else {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            startPauseButton.setTitle("Пауза", for: .normal)
        }
        isTimerRunning.toggle()
    }
    
    @objc private func stopTapped() {
        timer.invalidate()
        isTimerRunning = false
        counter = 0.0
        timerLabel.text = "0.0"
        startPauseButton.setTitle("Старт", for: .normal)
    }
    
    @objc private func updateTimer() {
        counter += 0.1
        timerLabel.text = String(format: "%.1f", counter)
    }
}

