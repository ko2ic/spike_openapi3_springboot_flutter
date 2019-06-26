package com.ko2ic.spikespringbootswagger

import org.springframework.web.bind.annotation.*


@RestController
@RequestMapping("/hello")
class HelloController {

    private var persons = mutableMapOf<Int, Person>()

    @GetMapping("/person")
    fun getPerson(@RequestParam(value = "id", required = false, defaultValue = "1") id: Int): Person {
        if (persons[id] == null) {
            return Person(-1, "not found")
        }

        return persons[id]!!
    }

    @PostMapping("/person")
    fun putPerson(@RequestBody person: Person): Person {
        persons[person.id] = person
        return person
    }
}