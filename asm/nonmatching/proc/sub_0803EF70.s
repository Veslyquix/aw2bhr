	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803EF70
sub_0803EF70: @ 0x0803EF70
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _0803F06C @ =0x000001C9
	bl sub_0803B4DC
	ldr r0, _0803F070 @ =gUnknown_08113BE0
	ldr r1, _0803F074 @ =0x06013940
	bl sub_08011CAC
	ldr r0, _0803F078 @ =gUnknown_081143D0
	ldr r1, _0803F07C @ =0x06014940
	bl sub_08011CAC
	ldr r0, _0803F080 @ =gUnknown_08114E34
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x40
	bl sub_08013618
	ldr r5, [r4, #0x2c]
	lsls r5, r5, #4
	ldr r0, _0803F084 @ =gUnknown_08499590
	ldr r1, [r0]
	movs r2, #4
	ldrsh r0, [r1, r2]
	subs r5, r5, r0
	ldr r4, [r4, #0x30]
	lsls r4, r4, #4
	movs r3, #6
	ldrsh r0, [r1, r3]
	subs r4, r4, r0
	ldr r7, _0803F088 @ =gUnknown_0849F820
	movs r0, #0
	ldrsh r1, [r7, r0]
	adds r1, r5, r1
	ldr r2, _0803F08C @ =0x000001FF
	ands r1, r2
	ldr r3, _0803F090 @ =gUnknown_0849F828
	movs r0, #0
	ldrsh r2, [r3, r0]
	adds r2, r4, r2
	movs r3, #0xff
	ands r2, r3
	ldr r0, _0803F094 @ =0x000031CA
	mov sb, r0
	movs r6, #0
	str r6, [sp]
	str r6, [sp, #4]
	ldr r0, _0803F098 @ =gUnknown_08113F84
	mov r3, sb
	bl sub_0801C70C
	movs r2, #2
	ldrsh r1, [r7, r2]
	adds r1, r5, r1
	ldr r3, _0803F08C @ =0x000001FF
	ands r1, r3
	movs r0, #0x80
	lsls r0, r0, #5
	orrs r1, r0
	ldr r0, _0803F090 @ =gUnknown_0849F828
	movs r3, #2
	ldrsh r2, [r0, r3]
	adds r2, r4, r2
	movs r0, #0xff
	ands r2, r0
	str r6, [sp]
	str r6, [sp, #4]
	ldr r0, _0803F098 @ =gUnknown_08113F84
	mov r3, sb
	bl sub_0801C70C
	ldr r1, _0803F09C @ =gUnknown_08114740
	mov r8, r1
	movs r2, #4
	ldrsh r1, [r7, r2]
	adds r1, r5, r1
	ldr r3, _0803F08C @ =0x000001FF
	ands r1, r3
	ldr r0, _0803F090 @ =gUnknown_0849F828
	movs r3, #4
	ldrsh r2, [r0, r3]
	adds r2, r4, r2
	movs r0, #0xff
	ands r2, r0
	ldr r3, _0803F0A0 @ =0x0000324A
	mov sl, r3
	str r6, [sp]
	str r6, [sp, #4]
	mov r0, r8
	bl sub_0801C70C
	movs r1, #6
	ldrsh r0, [r7, r1]
	adds r5, r5, r0
	ldr r2, _0803F08C @ =0x000001FF
	ands r5, r2
	ldr r3, _0803F090 @ =gUnknown_0849F828
	movs r1, #6
	ldrsh r0, [r3, r1]
	adds r4, r4, r0
	movs r2, #0xff
	ands r4, r2
	movs r0, #1
	str r0, [sp]
	str r6, [sp, #4]
	mov r0, r8
	adds r1, r5, #0
	adds r2, r4, #0
	mov r3, sl
	bl sub_0801C70C
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803F06C: .4byte 0x000001C9
_0803F070: .4byte gUnknown_08113BE0
_0803F074: .4byte 0x06013940
_0803F078: .4byte gUnknown_081143D0
_0803F07C: .4byte 0x06014940
_0803F080: .4byte gUnknown_08114E34
_0803F084: .4byte gUnknown_08499590
_0803F088: .4byte gUnknown_0849F820
_0803F08C: .4byte 0x000001FF
_0803F090: .4byte gUnknown_0849F828
_0803F094: .4byte 0x000031CA
_0803F098: .4byte gUnknown_08113F84
_0803F09C: .4byte gUnknown_08114740
_0803F0A0: .4byte 0x0000324A

