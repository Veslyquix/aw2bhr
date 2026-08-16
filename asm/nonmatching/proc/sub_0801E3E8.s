	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801E3E8
sub_0801E3E8: @ 0x0801E3E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	mov sl, r1
	mov sb, r2
	adds r4, r3, #0
	ldrh r3, [r4]
	adds r4, #2
	adds r0, r6, r3
	cmp r0, #0x80
	ble _0801E408
	movs r0, #1
	b _0801E49E
_0801E408:
	ldr r5, _0801E460 @ =gUnknown_03002520
	lsls r0, r6, #3
	adds r5, r0, r5
	cmp r3, #0
	beq _0801E49C
	movs r0, #0xff
	mov ip, r0
	ldr r1, _0801E464 @ =gUnknown_0808F0B8
	ldr r0, [sp, #0x20]
	lsls r0, r0, #1
	adds r0, r0, r1
	mov r8, r0
	ldr r7, _0801E468 @ =0x000001FF
	adds r6, r3, #0
_0801E424:
	ldrh r3, [r4]
	adds r4, #2
	adds r0, r3, #0
	mov r1, ip
	ands r0, r1
	mov r1, sb
	adds r2, r0, r1
	mov r0, ip
	ands r2, r0
	ldr r0, _0801E46C @ =0xFFFFFF00
	adds r1, r0, #0
	adds r0, r3, #0
	ands r0, r1
	orrs r0, r2
	strh r0, [r5]
	adds r5, #2
	movs r0, #0x80
	lsls r0, r0, #1
	ands r3, r0
	cmp r3, #0
	beq _0801E474
	ldrh r3, [r4]
	adds r4, #2
	ldr r0, _0801E470 @ =0x0000C1FF
	ands r3, r0
	mov r1, r8
	ldrh r0, [r1]
	orrs r3, r0
	b _0801E478
	.align 2, 0
_0801E460: .4byte gUnknown_03002520
_0801E464: .4byte gUnknown_0808F0B8
_0801E468: .4byte 0x000001FF
_0801E46C: .4byte 0xFFFFFF00
_0801E470: .4byte 0x0000C1FF
_0801E474:
	ldrh r3, [r4]
	adds r4, #2
_0801E478:
	adds r0, r3, #0
	ands r0, r7
	mov r1, sl
	adds r2, r0, r1
	ldr r1, _0801E4AC @ =0xFFFFFE00
	adds r0, r1, #0
	ands r3, r0
	ands r2, r7
	orrs r3, r2
	strh r3, [r5]
	adds r5, #2
	ldrh r0, [r4]
	strh r0, [r5]
	adds r4, #2
	adds r5, #4
	subs r6, #1
	cmp r6, #0
	bne _0801E424
_0801E49C:
	movs r0, #0
_0801E49E:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801E4AC: .4byte 0xFFFFFE00

