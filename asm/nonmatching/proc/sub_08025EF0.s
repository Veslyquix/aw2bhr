	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08025EF0
sub_08025EF0: @ 0x08025EF0
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	movs r2, #0xc0
	adds r1, r6, #0
	ands r1, r2
	adds r0, r5, #0
	ands r0, r2
	cmp r1, r0
	bne _08025F5E
	ldr r2, _08025F64 @ =gUnknown_085D5ABC
	ldr r4, _08025F68 @ =gUnknown_08090A58
	ldr r0, [r4]
	ldr r7, [r0]
	lsls r3, r6, #1
	adds r0, r3, r6
	lsls r0, r0, #2
	adds r0, r0, r7
	mov ip, r0
	ldrb r1, [r0]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r2, #0x14
	adds r0, r0, r2
	ldr r2, [r0]
	cmp r2, #0
	beq _08025F5E
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r7
	adds r1, r2, #1
	ldrb r0, [r0]
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _08025F5E
	ldrb r0, [r2]
	adds r1, r0, #0
	cmp r1, #1
	bne _08025F4A
	mov r2, ip
	ldrb r0, [r2, #7]
	cmp r0, #0
	bne _08025F5E
_08025F4A:
	cmp r1, #2
	bne _08025F6C
	ldr r0, [r4]
	ldr r1, [r0]
	adds r0, r3, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _08025F6C
_08025F5E:
	movs r0, #0
	b _08025F6E
	.align 2, 0
_08025F64: .4byte gUnknown_085D5ABC
_08025F68: .4byte gUnknown_08090A58
_08025F6C:
	movs r0, #1
_08025F6E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

