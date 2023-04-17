package play_test

import data.policy.allow

import future.keywords

test_allowed if {
    allow with input as {
        "user": {
            "username": "john",
            "roles":["developer"]
        }
    }
}

test_user_denied if {
    not allow with input as {
        "user": {
            "username": "peter",
            "roles":["developer"]
        }
    }
}

test_user_role_denied if {
    not allow with input as {
        "user": {
            "username": "peter",
            "roles":["admin"]
        }
    }
}