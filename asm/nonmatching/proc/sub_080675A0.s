	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080675A0
sub_080675A0: @ 0x080675A0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08067610 @ =0x000001FF
	ldr r0, _08067614 @ =gPal
	ldr r2, _08067618 @ =0x00007FFF
	ldr r3, _0806761C @ =0x000003FE
	adds r0, r0, r3
_080675AE:
	strh r2, [r0]
	subs r0, #2
	subs r1, #1
	cmp r1, #0
	bge _080675AE
	bl sub_080135A4
	bl sub_08012358
	bl sub_0801237C
	ldr r2, _08067620 @ =gDispIo
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2, #1]
	ldrb r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0
	bl sub_080638D0
	ldr r0, _08067624 @ =gUnknown_08581500
	bl Proc_EndEach
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08067602
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_08067602:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08067610: .4byte 0x000001FF
_08067614: .4byte gPal
_08067618: .4byte 0x00007FFF
_0806761C: .4byte 0x000003FE
_08067620: .4byte gDispIo
_08067624: .4byte gUnknown_08581500

