	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08077790
sub_08077790: @ 0x08077790
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080777C8 @ =gUnknown_0300064C
	ldr r0, [r0]
	movs r1, #0xa8
	subs r1, r1, r0
	movs r0, #0
	bl sub_08077620
	ldr r5, _080777CC @ =gpKeySt
	ldr r0, [r5]
	ldrh r1, [r0, #4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080777D0
	bl sub_08014878
	movs r0, #5
	bl sub_080733A0
	movs r0, #0x66
	bl sub_0803B4DC
	adds r0, r4, #0
	bl Proc_Break
	b _08077810
	.align 2, 0
_080777C8: .4byte gUnknown_0300064C
_080777CC: .4byte gpKeySt
_080777D0:
	bl sub_08014824
	cmp r0, #0
	bne _08077810
	ldr r0, [r5]
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080777FA
	bl sub_08014878
	movs r0, #0xe7
	lsls r0, r0, #1
	bl sub_0803B4DC
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	b _08077810
_080777FA:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08077810
	bl sub_08014878
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_08077810:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

