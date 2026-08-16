	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080290B0
sub_080290B0: @ 0x080290B0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	bl sub_08022AAC
	movs r0, #0
	mov ip, r0
	mov r8, r0
	ldr r1, _08029138 @ =gUnknown_08090B5C
	ldr r0, [r1]
	ldr r2, [r0]
	movs r3, #4
	ldrsh r0, [r2, r3]
	mov sb, r1
	cmp r0, #0
	bge _080290E4
	adds r0, #0xf
_080290E4:
	lsls r0, r0, #0xc
	lsrs r3, r0, #0x10
	movs r1, #6
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bge _080290F2
	adds r0, #0xf
_080290F2:
	lsls r0, r0, #0xc
	lsrs r7, r0, #0x10
	cmp r6, #0
	beq _0802913C
	subs r4, #7
	subs r5, #4
	cmp r4, #0
	bge _08029104
	movs r4, #0
_08029104:
	cmp r5, #0
	bge _0802910A
	movs r5, #0
_0802910A:
	adds r0, r4, #0
	adds r0, #0xf
	ldrh r1, [r2]
	cmp r0, r1
	ble _08029118
	adds r4, r1, #0
	subs r4, #0xf
_08029118:
	adds r0, r5, #0
	adds r0, #0xa
	ldrh r1, [r2, #2]
	cmp r0, r1
	ble _08029126
	adds r5, r1, #0
	subs r5, #0xa
_08029126:
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	cmp r0, r4
	bne _08029202
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r0, r5
	beq _08029220
	b _08029202
	.align 2, 0
_08029138: .4byte gUnknown_08090B5C
_0802913C:
	lsls r0, r3, #0x10
	asrs r2, r0, #0x10
	adds r1, r2, #2
	adds r6, r0, #0
	cmp r4, r1
	bge _08029150
	cmp r2, #0
	beq _08029150
	ldr r2, _080291AC @ =0x0000FFFE
	mov ip, r2
_08029150:
	asrs r1, r6, #0x10
	adds r0, r1, #0
	adds r0, #0xc
	cmp r4, r0
	ble _0802916C
	adds r0, #3
	mov r3, sb
	ldr r1, [r3]
	ldr r1, [r1]
	ldrh r1, [r1]
	cmp r0, r1
	bge _0802916C
	ldr r0, _080291B0 @ =0x0000FFF4
	mov ip, r0
_0802916C:
	lsls r0, r7, #0x10
	asrs r2, r0, #0x10
	adds r1, r2, #2
	adds r3, r0, #0
	cmp r5, r1
	bge _08029180
	cmp r2, #0
	beq _08029180
	ldr r1, _080291AC @ =0x0000FFFE
	mov r8, r1
_08029180:
	asrs r1, r3, #0x10
	adds r0, r1, #7
	cmp r5, r0
	ble _0802919A
	adds r0, #3
	mov r2, sb
	ldr r1, [r2]
	ldr r1, [r1]
	ldrh r1, [r1, #2]
	cmp r0, r1
	bge _0802919A
	ldr r0, _080291B4 @ =0x0000FFF9
	mov r8, r0
_0802919A:
	mov r1, ip
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	adds r7, r0, #0
	cmp r1, #0
	beq _080291B8
	adds r4, r4, r1
	b _080291BA
	.align 2, 0
_080291AC: .4byte 0x0000FFFE
_080291B0: .4byte 0x0000FFF4
_080291B4: .4byte 0x0000FFF9
_080291B8:
	asrs r4, r6, #0x10
_080291BA:
	mov r2, r8
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	adds r6, r0, #0
	cmp r1, #0
	beq _080291CA
	adds r5, r5, r1
	b _080291CC
_080291CA:
	asrs r5, r3, #0x10
_080291CC:
	cmp r4, #0
	bge _080291D2
	movs r4, #0
_080291D2:
	cmp r5, #0
	bge _080291D8
	movs r5, #0
_080291D8:
	adds r1, r4, #0
	adds r1, #0xf
	mov r3, sb
	ldr r0, [r3]
	ldr r2, [r0]
	ldrh r0, [r2]
	cmp r1, r0
	ble _080291EC
	adds r4, r0, #0
	subs r4, #0xf
_080291EC:
	adds r0, r5, #0
	adds r0, #0xa
	ldrh r1, [r2, #2]
	cmp r0, r1
	ble _080291FA
	adds r5, r1, #0
	subs r5, #0xa
_080291FA:
	cmp r7, #0
	bne _08029202
	cmp r6, #0
	beq _08029220
_08029202:
	mov r1, sb
	ldr r0, [r1]
	ldr r1, [r0]
	movs r0, #0
	strh r0, [r1, #0x10]
	ldr r0, _0802922C @ =gUnknown_0849A00C
	movs r1, #0
	bl sub_080152EC
	lsls r1, r4, #4
	strh r1, [r0, #0x22]
	lsls r1, r5, #4
	strh r1, [r0, #0x24]
	bl sub_08034F7C
_08029220:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802922C: .4byte gUnknown_0849A00C

