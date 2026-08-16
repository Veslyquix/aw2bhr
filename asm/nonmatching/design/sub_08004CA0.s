	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004CA0
sub_08004CA0: @ 0x08004CA0
	push {r4, lr}
	ldr r4, _08004CD8 @ =gUnknown_0200B0B0
	ldr r0, [r4]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08004CC4
	bl sub_08004C5C
	bl sub_08024268
	ldr r0, _08004CDC @ =gUnknown_08487C84
	movs r1, #2
	movs r2, #2
	movs r3, #0
	bl sub_0801A104
_08004CC4:
	ldr r0, [r4]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r0, #6
	bhi _08004D0A
	lsls r0, r0, #2
	ldr r1, _08004CE0 @ =_08004CE4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08004CD8: .4byte gUnknown_0200B0B0
_08004CDC: .4byte gUnknown_08487C84
_08004CE0: .4byte _08004CE4
_08004CE4: @ jump table
	.4byte _08004D00 @ case 0
	.4byte _08004D06 @ case 1
	.4byte _08004D0A @ case 2
	.4byte _08004D0A @ case 3
	.4byte _08004D0A @ case 4
	.4byte _08004D0A @ case 5
	.4byte _08004D0A @ case 6
_08004D00:
	bl sub_080036A4
	b _08004D0A
_08004D06:
	bl sub_0800376C
_08004D0A:
	pop {r4}
	pop {r0}
	bx r0

