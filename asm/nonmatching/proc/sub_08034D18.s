	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034D18
sub_08034D18: @ 0x08034D18
	push {lr}
	movs r0, #0
	bl sub_0802776C
	ldr r0, _08034D44 @ =gUnknown_030033EC
	ldrh r1, [r0]
	ldr r0, _08034D48 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1b]
	subs r0, #1
	cmp r0, #5
	bhi _08034DA6
	lsls r0, r0, #2
	ldr r1, _08034D4C @ =_08034D50
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08034D44: .4byte gUnknown_030033EC
_08034D48: .4byte gUnknown_08499598
_08034D4C: .4byte _08034D50
_08034D50: @ jump table
	.4byte _08034D68 @ case 0
	.4byte _08034D74 @ case 1
	.4byte _08034DA0 @ case 2
	.4byte _08034DA0 @ case 3
	.4byte _08034DA0 @ case 4
	.4byte _08034DA0 @ case 5
_08034D68:
	ldr r1, _08034D70 @ =gUnknown_030032D8
	movs r0, #0xd
	b _08034DA4
	.align 2, 0
_08034D70: .4byte gUnknown_030032D8
_08034D74:
	ldr r0, _08034D94 @ =gUnknown_03003FC0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _08034D88
	bl sub_0802F4F4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08034DA0
_08034D88:
	ldr r1, _08034D98 @ =gUnknown_03004780
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08034D9C @ =gUnknown_030032D8
	movs r0, #0xe
	b _08034DA4
	.align 2, 0
_08034D94: .4byte gUnknown_03003FC0
_08034D98: .4byte gUnknown_03004780
_08034D9C: .4byte gUnknown_030032D8
_08034DA0:
	ldr r1, _08034DAC @ =gUnknown_030032D8
	movs r0, #0x13
_08034DA4:
	strh r0, [r1]
_08034DA6:
	pop {r0}
	bx r0
	.align 2, 0
_08034DAC: .4byte gUnknown_030032D8

