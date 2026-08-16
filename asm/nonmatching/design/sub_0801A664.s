	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801A664
sub_0801A664: @ 0x0801A664
	push {r4, lr}
	sub sp, #4
	ldr r2, _0801A6B8 @ =gUnknown_03002F24
	ldr r0, _0801A6BC @ =gUnknown_03002F50
	ldr r4, [r2]
	cmp r4, r0
	beq _0801A6B0
	adds r1, r4, #0
	subs r1, #8
	str r1, [r2]
	subs r0, r4, #4
	ldr r0, [r0]
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	subs r2, r4, #7
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	subs r3, r4, #5
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	subs r4, #6
	ldrb r4, [r4]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	str r4, [sp]
	bl sub_08019F90
_0801A6B0:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801A6B8: .4byte gUnknown_03002F24
_0801A6BC: .4byte gUnknown_03002F50

