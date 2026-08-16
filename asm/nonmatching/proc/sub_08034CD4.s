	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034CD4
sub_08034CD4: @ 0x08034CD4
	push {lr}
	ldr r0, _08034CEC @ =gUnknown_03003FC0
	ldrb r0, [r0, #2]
	cmp r0, #0x8d
	beq _08034CFE
	cmp r0, #0x8d
	bgt _08034CF0
	cmp r0, #0x8b
	bgt _08034CF4
	cmp r0, #0x8a
	blt _08034CF4
	b _08034CFE
	.align 2, 0
_08034CEC: .4byte gUnknown_03003FC0
_08034CF0:
	cmp r0, #0x8f
	beq _08034CFE
_08034CF4:
	bl sub_08019260
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08034D0C
_08034CFE:
	ldr r0, _08034D10 @ =gUnknown_0849F790
	movs r1, #3
	bl Proc_Start
	ldr r1, _08034D14 @ =gUnknown_030032D8
	movs r0, #0xc
	strh r0, [r1]
_08034D0C:
	pop {r0}
	bx r0
	.align 2, 0
_08034D10: .4byte gUnknown_0849F790
_08034D14: .4byte gUnknown_030032D8

