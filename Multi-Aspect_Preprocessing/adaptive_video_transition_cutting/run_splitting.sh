DEVICE_ID=7
VIDEO_FOLDER="input_video_folder"
VIDEO_LIST="step0_video_list.txt"
JSON_FILE="step1_cutscene_frameidx.json"
JSON_FILE_2="step2_event_timecode.json"
OUTPUT_PATH="step3_output_video_folder"

CUDA_VISIBLE_DEVICES=$DEVICE_ID python step0_get_file_list.py --input_path $VIDEO_FOLDER --output_file $VIDEO_LIST
CUDA_VISIBLE_DEVICES=$DEVICE_ID python 1_cutscene_detect_find_miss.py --video-list $VIDEO_LIST --output-json-file $JSON_FILE
CUDA_VISIBLE_DEVICES=$DEVICE_ID python 1_event_stitching_find_miss.py --video-list $VIDEO_LIST --cutscene-frameidx $JSON_FILE --output-json-file $JSON_FILE_2
CUDA_VISIBLE_DEVICES=$DEVICE_ID python 1_video_splitting_find_miss.py --video-list $VIDEO_LIST --event-timecode $JSON_FILE_2 --output-folder $OUTPUT_PATH