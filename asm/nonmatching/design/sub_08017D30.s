	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08017D30
sub_08017D30: @ 0x08017D30
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _08017D58 @ =gUnknown_03002514
	ldrb r0, [r0]
	cmp r0, #1
	bne _08017D60
	ldr r2, _08017D5C @ =gUnknown_0200C528
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r2, #4
	adds r1, r1, r2
	ldr r0, [r1]
	adds r0, #0x10
	str r0, [r1]
	movs r0, #1
	b _08017D6C
	.align 2, 0
_08017D58: .4byte gUnknown_03002514
_08017D5C: .4byte gUnknown_0200C528
_08017D60:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	bl sub_08017A58
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
_08017D6C:
	pop {r1}
	bx r1

