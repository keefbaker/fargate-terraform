[
    {
        "cpu": ${cpu},
        "image": "nginx:latest",
        "memory": ${mem},
        "name": "${appname}",
        "networkMode": "awsvpc",
        "essential": true,
        "portMappings": [
            {
                "containerPort": ${port}
            }
        ]
    }
]