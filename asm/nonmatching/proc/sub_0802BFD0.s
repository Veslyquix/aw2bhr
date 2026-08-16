	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802BFD0
sub_0802BFD0: @ 0x0802BFD0
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, _0802C09C @ =gUnknown_030033EC
	ldrh r1, [r0]
	ldr r0, _0802C0A0 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #0x1c]
	movs r0, #2
	ands r0, r1
	ldr r5, _0802C0A4 @ =gUnknown_08090BD0
	ldr r4, _0802C0A8 @ =gUnknown_08090BD4
	cmp r0, #0
	bne _0802C016
	ldr r0, [r5]
	ldr r2, [r0]
	ldr r3, [r4]
	ldrh r1, [r3, #2]
	lsls r1, r1, #1
	ldr r7, _0802C0AC @ =0x0000417A
	adds r0, r2, r7
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r1, [r3]
	adds r0, r0, r1
	ldr r1, _0802C0B0 @ =0x0000234A
	adds r2, r2, r1
	adds r2, r2, r0
	ldrb r0, [r2]
	cmp r0, #0
	beq _0802C094
_0802C016:
	ldr r4, [r4]
	ldrh r1, [r4]
	ldr r5, [r5]
	ldr r2, [r5]
	ldrh r0, [r2, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	subs r1, r1, r0
	cmp r1, #0xe
	bhi _0802C094
	ldrh r1, [r4, #2]
	ldrh r0, [r2, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	subs r1, r1, r0
	cmp r1, #0
	blt _0802C094
	cmp r1, #9
	bgt _0802C094
	cmp r6, #0
	bne _0802C046
	movs r0, #0x37
	bl sub_0803B4DC
_0802C046:
	cmp r6, #1
	bne _0802C050
	movs r0, #0x36
	bl sub_0803B4DC
_0802C050:
	ldr r0, _0802C0B4 @ =gUnknown_081248F8
	ldr r1, _0802C0B8 @ =0x06013940
	bl sub_08011CAC
	ldr r0, _0802C0BC @ =gUnknown_08125190
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_08013618
	ldr r0, _0802C0C0 @ =gUnknown_08124FB8
	ldrh r1, [r4]
	lsls r1, r1, #4
	ldr r3, [r5]
	movs r5, #4
	ldrsh r2, [r3, r5]
	subs r1, r1, r2
	adds r1, #8
	ldrh r2, [r4, #2]
	lsls r2, r2, #4
	movs r7, #6
	ldrsh r3, [r3, r7]
	subs r2, r2, r3
	adds r2, #8
	ldr r3, _0802C0C4 @ =0x000031CA
	str r6, [sp]
	movs r4, #0
	str r4, [sp, #4]
	bl sub_0801C70C
	ldr r0, _0802C0C8 @ =gUnknown_0849A480
	movs r1, #3
	bl Proc_Start
_0802C094:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802C09C: .4byte gUnknown_030033EC
_0802C0A0: .4byte gUnknown_08499598
_0802C0A4: .4byte gUnknown_08090BD0
_0802C0A8: .4byte gUnknown_08090BD4
_0802C0AC: .4byte 0x0000417A
_0802C0B0: .4byte 0x0000234A
_0802C0B4: .4byte gUnknown_081248F8
_0802C0B8: .4byte 0x06013940
_0802C0BC: .4byte gUnknown_08125190
_0802C0C0: .4byte gUnknown_08124FB8
_0802C0C4: .4byte 0x000031CA
_0802C0C8: .4byte gUnknown_0849A480

