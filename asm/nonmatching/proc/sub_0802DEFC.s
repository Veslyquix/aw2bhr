	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802DEFC
sub_0802DEFC: @ 0x0802DEFC
	push {r4, r5, lr}
	bl sub_08023824
	bl sub_0802361C
	movs r0, #4
	bl sub_08023908
	movs r0, #5
	bl sub_08023274
	bl sub_0802DBF8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802DFA8
	ldr r0, _0802DF38 @ =gpKeySt
	ldr r0, [r0]
	ldrh r5, [r0, #4]
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _0802DF40
	movs r0, #0x66
	bl sub_0803B4DC
	ldr r1, _0802DF3C @ =gUnknown_03003334
	movs r0, #0
	strh r0, [r1]
	b _0802DFA8
	.align 2, 0
_0802DF38: .4byte gpKeySt
_0802DF3C: .4byte gUnknown_03003334
_0802DF40:
	ldr r0, _0802DFB0 @ =gUnknown_08499590
	ldr r2, [r0]
	ldr r3, _0802DFB4 @ =gUnknown_030033E4
	ldrh r1, [r3, #2]
	lsls r1, r1, #1
	ldr r4, _0802DFB8 @ =0x0000417A
	adds r0, r2, r4
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r1, [r3]
	adds r0, r0, r1
	adds r2, #0x12
	adds r2, r2, r0
	ldrb r2, [r2]
	cmp r2, #0
	beq _0802DFA8
	lsrs r0, r2, #6
	adds r0, #1
	ldr r1, _0802DFBC @ =gUnknown_030033EC
	ldrh r1, [r1]
	cmp r0, r1
	bne _0802DFA8
	ldr r1, _0802DFC0 @ =gUnknown_08499594
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r1, [r1]
	adds r4, r1, r0
	ldrb r1, [r4, #1]
	movs r3, #1
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _0802DFA8
	adds r0, r3, #0
	ands r0, r5
	cmp r0, #0
	beq _0802DFA8
	ldr r0, _0802DFC4 @ =gUnknown_03003FC0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802DFA2
	adds r1, r2, #0
	movs r0, #0x12
	movs r2, #0
	movs r3, #0
	bl sub_08034534
_0802DFA2:
	adds r0, r4, #0
	bl sub_0804018C
_0802DFA8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802DFB0: .4byte gUnknown_08499590
_0802DFB4: .4byte gUnknown_030033E4
_0802DFB8: .4byte 0x0000417A
_0802DFBC: .4byte gUnknown_030033EC
_0802DFC0: .4byte gUnknown_08499594
_0802DFC4: .4byte gUnknown_03003FC0

