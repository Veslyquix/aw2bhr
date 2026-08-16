	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08031C58
sub_08031C58: @ 0x08031C58
	push {r4, r5, lr}
	ldr r0, _08031CBC @ =gUnknown_0849B060
	ldr r0, [r0]
	ldrh r0, [r0, #0xa]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r2, _08031CC0 @ =gUnknown_084C145E
	ldr r5, _08031CC4 @ =0x00005010
	movs r0, #0x66
	movs r1, #0x38
	adds r3, r5, #0
	bl sub_0801BD00
	cmp r4, #0
	beq _08031C8E
	ldr r0, _08031CC8 @ =gUnknown_084C170C
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r2, [r1]
	movs r0, #0x6e
	movs r1, #0x38
	adds r3, r5, #0
	bl sub_0801BD00
_08031C8E:
	cmp r4, #0xa
	beq _08031CAA
	lsls r0, r4, #3
	adds r0, #0x6e
	ldr r2, _08031CCC @ =gUnknown_084C178C
	movs r1, #0xa
	subs r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x38
	adds r3, r5, #0
	bl sub_0801BD00
_08031CAA:
	ldr r2, _08031CD0 @ =gUnknown_084C1466
	movs r0, #0xbe
	movs r1, #0x38
	adds r3, r5, #0
	bl sub_0801BD00
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08031CBC: .4byte gUnknown_0849B060
_08031CC0: .4byte gUnknown_084C145E
_08031CC4: .4byte 0x00005010
_08031CC8: .4byte gUnknown_084C170C
_08031CCC: .4byte gUnknown_084C178C
_08031CD0: .4byte gUnknown_084C1466

