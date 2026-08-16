	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08048FD8
sub_08048FD8: @ 0x08048FD8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r5, #1
	bl sub_08048F10
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080490A8
	ldr r4, _08049068 @ =gUnknown_0812A158
	ldr r3, [r4]
	ldr r1, [r3]
	ldr r0, _0804906C @ =gUnknown_0200C420
	ldrb r2, [r0, #0xf]
	ldr r0, _08049070 @ =0x00000839
	adds r1, r1, r0
	strb r2, [r1]
	ldr r3, [r3]
	adds r1, r3, r0
	ldrb r0, [r1]
	adds r6, r4, #0
	cmp r0, #1
	bls _08049088
	ldr r2, _08049074 @ =0x00000836
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _08049084
	movs r5, #0
	movs r4, #0
	ldr r7, _08049078 @ =gUnknown_084C24A4
_08049018:
	adds r0, r4, #3
	lsls r0, r0, #3
	adds r0, r0, r7
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0804903E
	ldr r0, [r6]
	ldr r0, [r0]
	ldr r1, _0804907C @ =0x0000083D
	adds r0, r0, r1
	adds r0, r0, r5
	strb r4, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0804903E:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _08049018
	ldr r0, [r6]
	ldr r4, [r0]
	ldr r0, _08049080 @ =gUnknown_03004008
	ldr r0, [r0]
	adds r1, r5, #0
	bl __umodsi3
	ldr r2, _0804907C @ =0x0000083D
	adds r1, r4, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #3
	ldr r1, _08049070 @ =0x00000839
	adds r4, r4, r1
	strb r0, [r4]
	b _08049088
	.align 2, 0
_08049068: .4byte gUnknown_0812A158
_0804906C: .4byte gUnknown_0200C420
_08049070: .4byte 0x00000839
_08049074: .4byte 0x00000836
_08049078: .4byte gUnknown_084C24A4
_0804907C: .4byte 0x0000083D
_08049080: .4byte gUnknown_03004008
_08049084:
	movs r0, #2
	strb r0, [r1]
_08049088:
	cmp r5, #0
	beq _080490A2
	ldr r1, _080490B4 @ =gUnknown_084C24A0
	ldr r0, [r6]
	ldr r0, [r0]
	ldr r2, _080490B8 @ =0x00000839
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_080485DC
_080490A2:
	mov r0, r8
	bl Proc_Break
_080490A8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080490B4: .4byte gUnknown_084C24A0
_080490B8: .4byte 0x00000839

